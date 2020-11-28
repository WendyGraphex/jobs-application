<?php

class PartnerWorkCategoryMenuViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('menu', new PartnerWorkCategoryMenuForm($this->getDefault('menu')));
        $this->embedForm('menu_i18n', new PartnerWorkCategoryMenuI18nForm($this->getDefault('menu_i18n')));     
        $this->menu_i18n->addValidator('menu_id', new mfValidatorInteger());
        $this->menu->setValidator('category_id',new ObjectExistsValidator('PartnerWorkCategory',array('key'=>false,'required'=>false)));       
        unset($this->menu_i18n['id'],$this->menu['id']);
    }
    
    function getLanguage()
    {
        return $this['menu_i18n']['lang']->getValue();
    }

}