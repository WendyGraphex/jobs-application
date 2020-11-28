<?php


 class SiteEventBaseForm extends mfForm {
 
    function getSettings()
    {
        return $this->settings=$this->settings===null?new SiteSettings():$this->settings;
    }
    
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                                    
          //  "name"=>new mfValidatorString(array("max_length"=>64)),  
            "city"=>new mfValidatorString(array("max_length"=>128)),  
            'in_at'=>new mfValidatorI18nDate(),
            'out_at'=>new mfValidatorI18nDate(),
            'number_of_people'=>new mfValidatorInteger(array("required"=>false,"min"=>1)),  
            'country' => new mfValidatorI18nChoiceCountry(array()),
            "price"=>new mfValidatorI18nCurrency(array('required'=>false,'currency'=>$this->getSettings()->get('default_currency'))),  
           // "color"=>new mfValidatorString(array("required"=>false,"max_length"=>16)),    
          //  "icon"=>new mfValidatorFile(array("required"=>false,"mime_types" => "web_images","max_size"=>200 * 1024,"filename"=>"icon")),
            "picture"=>new mfValidatorFile(array("required"=>false,"mime_types" => "web_images","max_size"=>2 * 1024 * 1024,"filename"=>"picture"))
        ));
    }
    
 
}


