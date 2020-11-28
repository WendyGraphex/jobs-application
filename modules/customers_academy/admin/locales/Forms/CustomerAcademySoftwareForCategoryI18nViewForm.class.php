<?php



class CustomerAcademySoftwareForCategoryI18nViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('software', new CustomerAcademySoftwareForm($this->getDefault('software')));
        $this->embedForm('software_i18n', new CustomerAcademySoftwareI18nForm($this->getDefault('software_i18n')));
        unset($this->software_i18n['id'],$this->software['id']);
    }

    function getIcon()
    {
        return $this['software']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['software']['icon']->hasValue();
    }
    
    function getValuesForSoftware()
    {
        $values= $this['software']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForSoftwareI18n()
    {
        return $this['software_i18n']->getValue();      
    }
}
