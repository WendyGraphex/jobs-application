<?php

class EmployerGalleryNewForm extends mfForm {

  
    function __construct($language='en',$defaults=array())
    {                
        parent::__construct(array_merge(array('gallery_i18n'=>array('lang'=>$language)),$defaults));
    }
           
    function getLanguage()
    {          
        if ($this->isValid())
            return $this['gallery_i18n']['lang']->getValue(); 
        return new Language($this->defaults['gallery_i18n']['lang']);
    }
    
    
    function configure()
    {
        $this->embedForm('gallery', new EmployerGalleryForm($this->getDefault('gallery')));
        $this->embedForm('gallery_i18n', new EmployerGalleryI18nForm($this->getDefault('gallery_i18n')));       
        unset($this->gallery_i18n['id'],$this->gallery['id']);
    }
}