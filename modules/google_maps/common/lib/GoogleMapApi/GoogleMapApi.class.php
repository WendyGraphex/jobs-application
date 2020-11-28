<?php


class GoogleMapApi {
    
    protected $options=array(),$results=array(),$site=null,$error="";
    
    function __construct($options=array(),$site=null) {  
        $this->site=$site;
    }
    
    function getSite()
    {
        return $this->site;
    }
    
    function _call()
    {
        $this->results=array();
        $this->error="";
        $ch = curl_init();             
        $this->parameters=  array_merge($this->parameters,array("key"=>  GoogleMapsSettings::load($this->site)->get('key')));        
        curl_setopt($ch, CURLOPT_URL, "https://maps.googleapis.com/maps/api/geocode/json?".http_build_query($this->parameters));         
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
        curl_setopt($ch, CURLOPT_HEADER, false);        
        curl_setopt($ch,CURLOPT_TIMEOUT,5);  
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);   
        $content = curl_exec($ch);        
        curl_close($ch);         
        if ($content===false)
        {    
            trigger_error(curl_error($ch));
            return false;
        }          
        $values=  json_decode($content,true);
        if (isset($values['status']) && $values['status']!='OK')
        {               
            if ($values['status']=='ZERO_RESULTS')
                $this->error=__("No result");
            else
                $this->error=$values["error_message"];
            trigger_error($this->parameters['address']." ".$this->parameters['postcode']." ".$this->parameters['city']." ".$this->error);                                       
            return false;     
        }    
        $this->results=$values['results'];    
        return true;
    }
    
    
    function getCoordinatesFromAddress($address,$reverse=false,$separator="|")
    {
        $this->parameters=array("address"=>$address);
        if (!$this->_call())
        {          
            return false;               
        }   
        $this->latitude=$this->results[0]['geometry']['location']['lat'];
        $this->longitude=$this->results[0]['geometry']['location']['lng'];       
        if ($reverse)
            return $this->latitude.$separator.$this->longitude;       
        return $this->longitude.$separator.$this->latitude;       
    }
    
    
    function getLatitude()
    {
        return $this->latitude;
    }
    
    function getLongitude()
    {
        return $this->longitude;
    }
    
    function hasError()
    {
        return $this->error!='';
    }
    
    function getError()
    {
        return $this->error;
    }
    
    function getParameter($name,$default=null)
    {
        return isset($this->parameters[$name])?$this->parameters[$name]:$default;
    }
    
    function getParameters()
    {
        return $this->parameters;
    }
    
}