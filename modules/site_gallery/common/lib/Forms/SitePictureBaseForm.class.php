<?php


class SitePictureBaseForm extends mfForm {
    
    function configure()
    {
         $this->setValidators(array(
             "id"=>new mfValidatorInteger(),      
             "name"=>new mfValidatorName(),
             "height"=>new mfValidatorInteger(),
             "width"=>new mfValidatorInteger(),
             "is_active"=>new mfValidatorChoice(array("choices"=>array("YES","NO"))),        
             "start_at"=>new mfValidatorI18nDate(array("date_format"=>"a","required"=>false)),            
             "expired_at"=>new mfValidatorI18nDate(array("date_format"=>"a","required"=>false)),  
         ));    
    }
    
}