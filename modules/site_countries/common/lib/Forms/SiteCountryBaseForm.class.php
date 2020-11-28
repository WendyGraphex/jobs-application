<?php


 class SiteCountryBaseForm extends mfForm {
 

    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),
            "code"=>new mfValidatorChoice(array('choices'=> mfCountryInfo::getCountries())),
            ) 
        );
    }
    
 
}


