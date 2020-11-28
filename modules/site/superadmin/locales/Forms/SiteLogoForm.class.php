<?php


 
class SiteLogoForm extends mfForm {

    function configure() { 
        $this->setValidators(array(
            'id'=>new mfValidatorInteger(), 
            'logo'=>new mfValidatorFile(array(
                                    'required'=>false,
                                    'mime_types' => 'web_images',
                                    'max_size'=>Site::LOGO_SIZE,
                                    'filename'=>"logo",
                                                 )
                                            ))
                );
    }
}