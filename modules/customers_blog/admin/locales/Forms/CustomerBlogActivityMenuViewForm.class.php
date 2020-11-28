<?php

class CustomerBlogActivityMenuViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('menu', new CustomerBlogActivityMenuForm($this->getDefault('menu')));
        $this->embedForm('menu_i18n', new CustomerBlogActivityMenuI18nForm($this->getDefault('menu_i18n')));     
        $this->menu_i18n->addValidator('menu_id', new mfValidatorInteger());
        $this->menu->setValidator('activity_id',new ObjectExistsValidator('CustomerBlogActivity',array('key'=>false,'required'=>false,'empty_value'=>null)));       
        unset($this->menu_i18n['id'],$this->menu['id']);
    }
    
    function getLanguage()
    {
        return $this['menu_i18n']['lang']->getValue();
    }

}
