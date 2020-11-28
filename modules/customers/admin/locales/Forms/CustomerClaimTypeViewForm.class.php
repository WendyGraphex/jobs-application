<?php



class CustomerClaimTypeViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('type', new CustomerClaimTypeForm($this->getDefault('type')));
        $this->embedForm('type_i18n', new CustomerClaimTypeI18nForm($this->getDefault('type_i18n')));
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
    
    function getValuesForType()
    {
        $values= $this['type']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForTypeI18n()
    {
        return $this['type_i18n']->getValue();      
    }
}
