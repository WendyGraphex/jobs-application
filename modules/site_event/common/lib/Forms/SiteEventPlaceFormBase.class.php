<?php

 class SiteEventPlaceBaseForm extends mfForm {   
   
    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                      
            'name'=>new mfValidatorString(array()),
            'picture'=>new mfValidatorFile(array(
                    'required'=>false,
                    'mime_types' => 'web_images',
                    'max_size'=>1 * 1024 * 1024,                                    
                                 )
                ), 
            'email'=>new mfValidatorString(array()),
            'phone'=>new mfValidatorString(array('required'=>false)),
            'mobile'=>new mfValidatorString(array('required'=>false)),
            'fax'=>new mfValidatorString(array('required'=>false)),
            'web'=>new mfValidatorDomain(array('required'=>false)),
            'address1'=>new mfValidatorString(array('required'=>false)),
            'address2'=>new mfValidatorString(array('required'=>false)),            
            'postcode'=>new mfValidatorString(array('required'=>false)),
            'city'=>new mfValidatorString(array('required'=>false)),
            'country' => new mfValidatorI18nChoiceCountry(array()),
            ) 
        );
    }
     
}


