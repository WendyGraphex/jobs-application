<?php

class SiteGalleryI18nViewForm extends mfForm {
      
    protected $user=null;
    
    function __construct($user,$defaults=array())
    {              
        $this->user=$user;      
        parent::__construct($defaults);
    }
           
    function getUser()
    {
        return $this->user;
    }
            
    function configure()
    {
        $this->embedForm('gallery_i18n', new SiteGalleryI18nForm($this->getDefault('gallery_i18n')));                         
        $this->embedForm('gallery', new SiteGalleryBaseForm($this->getDefault('gallery')));   
        unset($this->gallery_i18n['is_active'],$this->gallery_i18n['id'],$this->gallery['id']);
        $this->gallery_i18n->addValidator('gallery_id',new mfValidatorInteger());
        
    }
 
}
