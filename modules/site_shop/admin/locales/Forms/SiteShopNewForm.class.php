<?php


class SiteShopNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('shop_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('shop', new SiteShopBaseForm($this->getDefault('shop')));
        $this->embedForm('shop_i18n', new SiteShopI18nBaseForm($this->getDefault('shop_i18n')));
        unset($this->shop_i18n['id'],$this->shop['id']);
    }
    
    function getIcon()
    {
        return $this['shop']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['shop']['icon']->hasValue();
    }
    
    function getFavicon()
    {
        return $this['shop']['favicon']->getValue();
    }
    
    function hasFavicon()
    {
        return $this['shop']['favicon']->hasValue();
    }
    
    function getLogo()
    {
        return $this['shop']['logo']->getValue();
    }
    
    function hasLogo()
    {
        return $this['shop']['logo']->hasValue();
    }
}

