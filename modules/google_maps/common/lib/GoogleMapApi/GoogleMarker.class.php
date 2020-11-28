<?php


class GoogleMarker extends GPSCoordinate {
    
    protected $title="",$icon="";
    
    function __construct($lat,$lng=null,$title="",$icon="") 
    {  
        if ($lat instanceof GPSCoordinate)
        {
            $this->lat=$lat->getLatitude();
            $this->lng=$lat->getLongitude();
        }   
        else
        {
             $this->lat=  floatval($lat);
             $this->lng=floatval($lng);
        }           
        $this->title=$title;    
        $this->icon=$icon;
    }
    
    function setIcon($icon)
    {
        $this->icon=$icon;
        return $this;
    } 
    
    function setID($id)
    {
        $this->id=$id;
        return $this;
    } 
    
    function getPositionJson()
    {        
        return json_encode(array('lng'=>$this->lng,'lat'=>$this->lat));
    }
    
    function hasTitle()
    {
        return (boolean)$this->title;
    }
    
    function  getTitle()
    {
        return $this->title;
    }
    
    function hasIcon()
    {
        return (boolean)$this->icon;
    }
    
    function getIcon()
    {
        return $this->icon;
    }
    
    function getID()
    {
        return $this->id;
    }
    
    function getLat()
    {
        return $this->lat;
    }
    
    function getLng()
    {
        return $this->lng;
    }
    
    function toArray($fields=null)
    {
         if ($fields==null)
           $fields=array('id','lat','lng','icon','title');
        $values=array();
        foreach ($fields as $field)
           $values[$field]=$this->$field;
        return $values;        
    }
    
    function toJson($fields=null)
    {
        if ($fields==null)
           $fields=array('id','lat','lng','icon','title');
        $values=array();
        foreach ($fields as $field)
           $values[$field]=$this->$field;
        return json_encode($values);
    }
}