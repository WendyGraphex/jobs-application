<?php

class EmployerGalleryViewForm extends mfForm {

   function configure()
    {
        $this->embedForm('gallery', new EmployerGalleryBaseForm($this->getDefault('gallery')));
        $this->embedForm('gallery_i18n', new EmployerGalleryI18nForm($this->getDefault('gallery_i18n')));    
        $this->gallery_i18n->addValidator('gallery_id',new mfValidatorInteger());     
        unset($this->gallery_i18n['id'],$this->gallery['id']);
    }
    
}