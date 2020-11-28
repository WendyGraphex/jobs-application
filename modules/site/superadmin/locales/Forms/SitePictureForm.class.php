<?php


 
class SitePictureForm extends mfForm {

    function configure() { 
        $this->setValidators(array(
            'id'=>new mfValidatorInteger(), 
            'picture'=>new mfValidatorFile(array(
                                    'required'=>false,
                                    'mime_types' => 'web_images',
                                    'max_size'=>Site::PICTURE_SIZE,
                                    'filename'=>"picture",
                                                 )
                                            ))
                );
    }
}