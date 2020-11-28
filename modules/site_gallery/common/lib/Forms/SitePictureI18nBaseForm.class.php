<?php


class SitePictureI18nBaseForm extends mfForm {
    
   
    function configure()
    {
         $this->setValidators(array(
             "id"=>new mfValidatorInteger(),      
             "title"=>new mfValidatorString(array('max_length'=>255)), 
             "link"=>new mfValidatorString(array('max_length'=>255,"required"=>false)), 
             "target"=>new mfValidatorChoice(array("choices"=>array(""=>__('Select a target'),"_blank"=>__("_blank"),"parent"=>__("parent"),"top"=>__("top")),"required"=>false,"empty_value"=>"")),
             'lang'=> new languagesExistsValidator(array(),'frontend'),
             "description"=>new mfValidatorString(array('required'=>false)),
             "content"=>new mfValidatorString(array('required'=>false)),
           //  "picture"=>new mfValidatorFile(array("max_size"=>2 * 1024 *1024,"mime_types"=>"web_images")),            
         ));    
    }
    
}