<?php


 class CustomerBlogArticleBaseForm extends mfForm {
 
 /*   function getSettings()
    {
        return $this->settings=$this->settings===null?new CustomerBlogSettings():$this->settings;
    }*/
    
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                                    
           'started_at'=>new mfValidatorI18nDate(array("required"=>false)),
            'expired_at'=>new mfValidatorI18nDate(array("required"=>false)),
          'author'=>new mfValidatorString(array("required"=>false)),
          //  "icon"=>new mfValidatorFile(array("required"=>false,"mime_types" => "web_images","max_size"=>200 * 1024,"filename"=>"icon")),
            "picture"=>new mfValidatorFile(array("required"=>false,"mime_types" => "web_images","max_size"=>2 * 1024 * 1024,"filename"=>"picture"))
        ));
    }
    
 
}


