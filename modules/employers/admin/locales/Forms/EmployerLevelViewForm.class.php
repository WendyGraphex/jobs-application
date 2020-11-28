<?php


require_once dirname(__FILE__)."/EmployerLevelI18nForm.class.php";


class EmployerLevelViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('level', new EmployerLevelBaseForm($this->getDefault('level')));
        $this->embedForm('level_i18n', new EmployerLevelI18nForm($this->getDefault('level_i18n')));
        unset($this->level_i18n['id'],$this->level['id']);
    }

    function getIcon()
    {
        return $this['level']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['level']['icon']->hasValue();
    }
    
    function getValuesForLevel()
    {
        $values= $this['level']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForLevelI18n()
    {
        return $this['level_i18n']->getValue();      
    }
}
