<?php

class GoogleMapsSettingsForm extends mfFormSite {
 
    function __construct($site) {
        parent::__construct(array(),array(),$site);
    }
   
    function configure()
    {
        $this->setValidators(array(
        
             
            "key"=>new mfValidatorString(array("min_length"=>1,"max_length"=>50)),
                      
            
            ) 
        );
    }
    
 
}


