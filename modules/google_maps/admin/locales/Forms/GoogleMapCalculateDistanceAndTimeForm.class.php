<?php

class GoogleMapCalculateDistanceAndTimeForm extends mfForm {
    
    
    function configure()
    {
        $this->setValidators(array(
             'origin'=>new mfValidatorString(),            
             'destination'=>new mfValidatorString(),  
             'by_address'=>new mfValidatorBoolean()
        ));
    }
    
    
}
