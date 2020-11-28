<?php

class SitePictureUploadForGalleryI18nForm extends mfForm {
    
     
    
    function configure()
    {
        $this->setValidators(array(               
            'picture'=>new mfValidatorFile(array('max_size'=>8 * 1024 * 1024))
        ));      
    }
    
   
    function getPicture()
    {
        return $this['picture']->getValue();
    }
    
     
}

