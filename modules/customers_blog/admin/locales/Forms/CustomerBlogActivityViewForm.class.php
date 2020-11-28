<?php


require_once dirname(__FILE__)."/CustomerBlogActivityI18nForm.class.php";


class CustomerBlogActivityViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('activity', new CustomerBlogActivityBaseForm($this->getDefault('activity')));
        $this->embedForm('activity_i18n', new CustomerBlogActivityI18nForm($this->getDefault('activity_i18n')));      
        unset($this->activity_i18n['id'],$this->activity['id']);
    }
    
    function getLanguage()
    {
        return $this['activity_i18n']['lang']->getValue();
    }

}
