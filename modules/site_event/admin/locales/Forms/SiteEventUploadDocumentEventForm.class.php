<?php

class SiteEventUploadDocumentEventForm extends mfForm {
    
   
    function configure()
    {
        $this->setValidators(array(       
            'id'=>new ObjectExistsValidator('SiteEvent',array('key'=>false,'required'=>false,'empty_value'=>new SiteEvent())),               
            'file'=>new mfValidatorFile(array('max_size'=>8 * 1024 * 1024))
        ));      
    }
    
   
    function getFile()
    {
        return $this['file']->getValue();
    }
    
    
    function getEvent()
    {
        return $this['id']->getValue();
    }
  
}

