<?php


 class SaleTaxBaseForm extends mfForm {
 
    
    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                              
            "rate"=>new mfValidatorI18nPourcentage(),            
            "description"=>new mfValidatorString(array("max_length"=>"255",'required'=>false)),            
                                                               
            ) 
        );
    }
    
 
}


