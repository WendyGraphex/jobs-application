<?php


require_once dirname(__FILE__)."/PartnerWorkCategoryI18nForm.class.php";


class PartnerWorkCategoryViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('category', new PartnerWorkCategoryBaseForm($this->getDefault('category')));
        $this->embedForm('category_i18n', new PartnerWorkCategoryI18nForm($this->getDefault('category_i18n')));      
        unset($this->category_i18n['id'],$this->category['id']);
    }
    
    function getLanguage()
    {
        return $this['category_i18n']['lang']->getValue();
    }

}
