<?php


 class SaleEmployerCommissionBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                                    
            "name"=>new mfValidatorString(array("max_length"=>64)),  
            "started_at"=>new mfValidatorI18nDate(array("required"=>false,'date_format'=>'a')),
            "expired_at"=>new mfValidatorI18nDate(array("required"=>false,'date_format'=>'a'))
        ));
    }
    
 
}


