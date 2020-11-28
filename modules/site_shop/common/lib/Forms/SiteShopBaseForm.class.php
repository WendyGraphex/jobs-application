<?php


 class SiteShopBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                                                            
            "icon"=>new mfValidatorFile(array("required"=>false,"mime_types" => "web_images","max_size"=>200 * 1024,"filename"=>"icon")),
            "favicon"=>new mfValidatorFile(array("required"=>false,"mime_types" => "web_images","max_size"=>200 * 1024,"filename"=>"favicon")),
            "logo"=>new mfValidatorFile(array("required"=>false,"mime_types" => "web_images","max_size"=>200 * 1024,"filename"=>"logo"))
        ));
    }
    
 
}


