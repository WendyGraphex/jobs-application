<?php


 class SiteEventSellerCommissionRateBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                                               
        //    "started_at"=>new mfValidatorI18nDate(array('required'=>false,'date_format'=>'a')),
        //    "expired_at"=>new mfValidatorI18nDate(array('required'=>false,'date_format'=>'a')),
            'from'=>new mfValidatorI18nNumber(),
            'to'=>new mfValidatorI18nNumber(),
            'fix'=>new mfValidatorI18nNumber(),
            'rate'=>new mfValidatorI18nPourcentage(),
        ));
    }
    
 
}


