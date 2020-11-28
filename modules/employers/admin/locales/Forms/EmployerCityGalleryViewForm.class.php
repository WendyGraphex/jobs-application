<?php

class EmployerCityGalleryViewForm extends mfForm {

  function configure()
    {
        $this->embedForm('gallery', new EmployerCityGalleryBaseForm($this->getDefault('gallery')));
        $this->embedForm('gallery_i18n', new EmployerCityGalleryI18nForm($this->getDefault('gallery_i18n')));    
        $this->gallery_i18n->addValidator('gallery_id',new mfValidatorInteger());     
        unset($this->gallery_i18n['id'],$this->gallery['id']);
    }
     
    
}