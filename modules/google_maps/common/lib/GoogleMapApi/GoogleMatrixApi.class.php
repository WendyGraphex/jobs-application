<?php

// https://developers.google.com/maps/documentation/distance-matrix/intro

// https://maps.googleapis.com/maps/api/distancematrix/json?origins=48.826294,2.346419&destinations=48.866599,2.354878
class GoogleMatrixApi {
    
    protected $options=array(),$results=array();
    
    function __construct($options=array()) {  
        $this->options=$options;
    }
    
    function _call()
    {
        $this->results=array();
        $ch = curl_init();             
        $this->parameters=  array_merge($this->parameters,$this->options,array());      
        //var_dump($this->parameters);
        curl_setopt($ch, CURLOPT_URL, "https://maps.googleapis.com/maps/api/distancematrix/json?".http_build_query($this->parameters));         
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
        curl_setopt($ch, CURLOPT_HEADER, false);        
        curl_setopt($ch,CURLOPT_TIMEOUT,10);  
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);   
        $content = curl_exec($ch);  
      // var_dump($content);
        curl_close($ch);         
        if ($content===false)
        {    
            trigger_error(curl_error($ch));
            return false;
        }                      
        $values=  json_decode($content,true);         
       // var_dump($values);
        
        if (isset($values['status']) && $values['status']!='OK')
        {                    
            $this->errors=$values['status']." ".$values['error_message'];
            trigger_error($this->parameters['origins']." ".$this->parameters['destinations'].$values["error_message"]);                      
            return false;     
        }    
        $this->results=$values;            
        return true;
    }
    
    
    function getItineraryFromCoordinates($origins,$destinations,$class="Itinerary")
    {                       
        $this->parameters=array("origins"=>$origins->getCoordinates(),'destinations'=>$destinations->getCoordinates());
        if (!$this->_call())
            return false;                     
        $itinerary=new Itinerary();     
        if ($origins instanceof ArrayAccess && $destinations instanceof ArrayAccess)
        {                
            $origins->rewind();
            $destinations->rewind();
            foreach ($this->results['rows'] as $index=>$row)
            {
                $step=new ItineraryStep($origins->current(),$destinations->current(),$row["elements"][$index]['distance']['value'],$row['elements'][$index]['duration']['value']);
                $itinerary[]=$step;
                $origins->next();
                $destinations->next();
            }
        }
        else
        {      
            $step=new ItineraryStep($origins,$destinations,$this->results['rows'][0]["elements"][0]['distance']['value'],$this->results['rows'][0]['elements'][0]['duration']['value']);
            $itinerary[]=$step;
        }            
        return $itinerary;
    }
    
    function getItineraryFromAddresses($origin,$destination,$class="Itinerary")
    {
        $this->parameters=array("origins"=>$origin->getFullAddress(),'destinations'=>$destination->getFullAddress());
        if (!$this->_call())
            return false;            
        $itinary=new Itinerary($origin,$destination);      
        if ($this->results['rows'][0]['elements'][0]['status']!='OK')
        {    
            $this->errors=$this->results['rows'][0]['elements'][0]['status'];
            return false;
        }
      //  echo "<pre>"; var_dump($this->results['rows'][0]['elements'][0]); echo "</pre>"; 
        $itinary->setTime($this->results['rows'][0]['elements'][0]['duration']['value']);
        $itinary->setDistance($this->results['rows'][0]['elements'][0]['distance']['value']);
        return $itinary;
    }
   
    function hasErrors()
    {
        return (boolean)$this->errors;
    }
    
    function getErrors()
    {
           return $this->errors;
    }
}