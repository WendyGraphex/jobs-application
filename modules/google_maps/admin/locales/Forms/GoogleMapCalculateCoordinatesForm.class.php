<?php

class GoogleMapCalculateCoordinatesForm extends mfForm {
    
    
    function configure()
    {
        $this->setValidators(array(
             'address'=>new mfValidatorString(),            
        ));
    }
    
    
}
