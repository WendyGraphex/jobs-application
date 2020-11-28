<?php

 class SiteCurrencyBaseForm extends mfForm {   
   
    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),            
            "rate"=>new mfValidatorI18nNumber(),            
            "code"=>new mfValidatorI18nCurrencies()                                   
            ) 
        );
    }
     
}


