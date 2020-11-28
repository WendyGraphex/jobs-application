<?php


//require_once dirname(__FILE__)."/EmployerBudgetUnitI18nForm.class.php";


class EmployerBudgetUnitViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('unit', new EmployerBudgetUnitForm($this->getDefault('unit')));
        $this->embedForm('unit_i18n', new EmployerBudgetUnitI18nForm($this->getDefault('unit_i18n')));
        unset($this->unit_i18n['id'],$this->unit['id']);
    }

    function getIcon()
    {
        return $this['unit']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['unit']['icon']->hasValue();
    }
    
    function getValuesForUnit()
    {
        $values= $this['unit']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForUnitI18n()
    {
        return $this['unit_i18n']->getValue();      
    }
}
