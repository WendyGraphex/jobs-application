<?php


class SiteGalleryI18nBaseForm extends mfForm {
    

    function configure()
    {
         $this->setValidators(array(
             "id"=>new mfValidatorInteger(),    //  
             "title"=>new mfValidatorName(array("required"=>false)),    // 
             'lang'=> new languagesExistsValidator(array(),'frontend'), //                        
             'link'=>new mfValidatorString(array("required"=>false)), //            
         ));    
    }
    
}