<?php


class CustomerCourseCategoryViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('category', new CustomerCourseCategoryBaseForm($this->getDefault('category')));
        $this->embedForm('category_i18n', new CustomerCourseCategoryI18nForm($this->getDefault('category_i18n')));      
        unset($this->category_i18n['id'],$this->category['id']);
    }
    
    function getLanguage()
    {
        return $this['category_i18n']['lang']->getValue();
    }

}
