<?php

require_once __DIR__."/UploadPictureEventForm.class.php";

class UploadPictureEventNewForm extends UploadPictureEventForm {
    
    protected $event =null;
    
    function configure() {
        parent::configure();
        $this->addValidators(array(            
            'id'=>new ObjectExistsValidator('SiteEvent',array('key'=>false,'empty_value'=>new SiteEvent(),'required'=>false)),           
        ));                
    }
    
    
    function hasEvent()
    {
        return (boolean)$this['id']->getValue();
    }
    
    function getEvent()
    {       
        return  $this['id']->getValue();      
    }
}
 