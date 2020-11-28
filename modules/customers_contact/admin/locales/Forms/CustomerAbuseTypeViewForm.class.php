<?php



class CustomerAbuseTypeViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('abuse', new CustomerAbuseTypeForm($this->getDefault('abuse')));
        $this->embedForm('abuse_i18n', new CustomerAbuseTypeI18nForm($this->getDefault('abuse_i18n')));
        unset($this->abuse_i18n['id'],$this->abuse['id']);
    }

    function getIcon()
    {
        return $this['abuse']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['abuse']['icon']->hasValue();
    }
    
    function getValuesForAbuseType()
    {
        $values= $this['abuse']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForAbuseTypeI18n()
    {
        return $this['abuse_i18n']->getValue();      
    }
}
