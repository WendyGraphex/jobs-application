<?php

class Address extends mfObjectCore {

   function getPartialAddress()
    {
        return $this->get('address1')."\n".$this->get('address2');
    }
    
    function getFullAddress()
    {
        $address="";
        foreach (array('address1','address2','postcode','city') as $field)
                $address.=$this->get($field)." ";
        return $address;
    }
    
    function calculateCoordinates()
    {
        $googlemap_api=new GoogleMapApi();        
        if (!$coordinates=$googlemap_api->getCoordinatesFromAddress($this->getFullAddress()))
            return false;      
        $this->set('lat',$coordinates->getLatitude());
        $this->set('lng',$coordinates->getLongitude());
        return true;
    }  
    
    function getSignature()
    {
        return sha1($this->getFullAddress().$this->country.$this->state);
    }
    
   
    function __toString() {
        return (string)trim($this->address1." ".$this->postcode." ".$this->city." ".$this->formatted_country);
    }

}
    