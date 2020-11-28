<?php



class EmployeeFunctionViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('function', new EmployeeFunctionForm($this->getDefault('function')));
        $this->embedForm('function_i18n', new EmployeeFunctionI18nForm($this->getDefault('function_i18n')));
        unset($this->function_i18n['id'],$this->function['id']);
    }

    function getIcon()
    {
        return $this['function']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['function']['icon']->hasValue();
    }
    
    function getValuesForFunction()
    {
        $values= $this['function']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForFunctionI18n()
    {
        return $this['function_i18n']->getValue();      
    }
}
