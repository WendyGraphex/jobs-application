<?php


require_once dirname(__FILE__)."/EmployerContractTypeI18nForm.class.php";


class EmployerContractTypeViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('type', new EmployerContractTypeBaseForm($this->getDefault('type')));
        $this->embedForm('type_i18n', new EmployerContractTypeI18nForm($this->getDefault('type_i18n')));
        unset($this->type_i18n['id'],$this->type['id']);
    }

    function getIcon()
    {
        return $this['type']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['type']['icon']->hasValue();
    }
    
    function getValuesForContractType()
    {
        $values= $this['type']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForContractTypeI18n()
    {
        return $this['type_i18n']->getValue();      
    }
}
