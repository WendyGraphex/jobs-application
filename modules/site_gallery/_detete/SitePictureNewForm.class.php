<?php


class SitePictureNewForm extends mfForm {
    
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;
        $this->getDefault('lang',$this->getLanguage());
        parent::__construct($defaults,array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {             
       $this->embedForm('picture_i18n', new SitePictureI18nNewForm($this->getDefault('picture_i18n')));           
       $this->embedForm('picture', new SitePictureBaseForm($this->getDefault('picture')));
       $this->picture['name']->setOption('required',false);
       unset($this->picture['id'],$this->picture['height'],$this->picture['width'],$this->picture['is_active']);
    }
}


