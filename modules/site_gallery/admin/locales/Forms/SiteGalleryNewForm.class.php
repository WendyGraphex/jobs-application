<?php


class SiteGalleryNewForm extends mfForm {
    
    protected $language=null,$user=null;
    
    function __construct($user,$language='en',$defaults=array())
    {       
        $this->language=$language;
        $this->user=$user;
        $this->getDefault('lang',$this->getLanguage());
        parent::__construct($defaults,array());
    }
           
    function getUser()
    {
        return $this->user;
    }
    
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {           
       $this->embedForm('gallery_i18n', new SiteGalleryI18nForm($this->getDefault('gallery_i18n')));           
       $this->embedForm('gallery', new SiteGalleryForm($this->getDefault('gallery')));    
       unset($this->gallery['id'],$this->gallery_i18n['id']);       
    }
}


