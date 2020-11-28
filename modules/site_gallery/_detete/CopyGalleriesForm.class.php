<?php


class CopyGalleriesForm extends mfForm {
    
    
    
    function configure() {
        $this->setValidators(array(
            "languages"=>new LanguageCollectionExistsValidator('admin'),
            "selected" =>new GalleryI18nCollectionExistsValidator()
        ));
    }
    
    
    function getGalleriesI18n()
    {
        return $this['selected']->getArray();
    }
    
    function getLanguages()
    {
        return $this['languages']->getArray();
    }
}
