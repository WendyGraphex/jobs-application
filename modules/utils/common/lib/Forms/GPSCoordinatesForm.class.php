<?php

class GPSCoordinateForm extends mfForm {
    
     function configure()
    {       
        $this->setValidators(array(
            'lat'=>new mfValidatorI18nNumber(array('min'=>-90,"max"=>90)),
            'lng'=>new mfValidatorI18nNumber(array('min'=>-90,"max"=>90))
        ));     
    }
}