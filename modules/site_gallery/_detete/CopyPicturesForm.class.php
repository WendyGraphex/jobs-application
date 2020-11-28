<?php


class CopyPicturesForm extends mfForm {
    
    
    
    function configure() {
        $this->setValidators(array(
            "languages"=>new LanguageCollectionExistsValidator('admin'),
            "selected" =>new SitePictureI18nCollectionExistsValidator()
        ));
    }
    
    
    function getPicturesI18n()
    {
        return $this['selected']->getArray();
    }
    
    function getLanguages()
    {
        return $this['languages']->getArray();
    }
}
