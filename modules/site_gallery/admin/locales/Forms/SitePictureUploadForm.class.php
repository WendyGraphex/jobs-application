<?php

class SitePictureUploadForm extends mfForm {
    
     
    
    function configure()
    {
        $this->setValidators(array(    
            'lang'=> new languagesExistsValidator(array(),'frontend'),
            'picture'=>new mfValidatorFile(array('max_size'=>8 * 1024 * 1024))
        ));      
    }
    
   
    function getPicture()
    {
        return $this['picture']->getValue();
    }
    
    function getLanguage()
    {
        return $this['lang']->getValue();
    }
   
  
}

