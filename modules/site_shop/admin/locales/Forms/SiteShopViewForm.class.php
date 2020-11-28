<?php


require_once dirname(__FILE__)."/SiteShopI18nForm.class.php";


class SiteShopViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('shop', new SiteShopBaseForm($this->getDefault('shop')));
        $this->embedForm('shop_i18n', new SiteShopI18nForm($this->getDefault('shop_i18n')));
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
    
    function getValuesForShop()
    {
        $values= $this['shop']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForShopI18n()
    {
        return $this['shop_i18n']->getValue();      
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
