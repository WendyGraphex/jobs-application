<?php


require_once dirname(__FILE__)."/SaleQuotationStateI18nForm.class.php";


class SaleQuotationStateViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('state', new SaleQuotationStateForm($this->getDefault('state')));
        $this->embedForm('state_i18n', new SaleQuotationStateI18nForm($this->getDefault('state_i18n')));
        unset($this->state_i18n['id'],$this->state['id']);
    }

    function getIcon()
    {
        return $this['state']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['state']['icon']->hasValue();
    }
    
    function getValuesForState()
    {
        $values= $this['state']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForStateI18n()
    {
        return $this['state_i18n']->getValue();      
    }
}
