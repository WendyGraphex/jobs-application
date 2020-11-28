<?php



class EmployeeLanguageLevelViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('level', new EmployeeLanguageLevelForm($this->getDefault('level')));
        $this->embedForm('level_i18n', new EmployeeLanguageLevelI18nForm($this->getDefault('level_i18n')));
        unset($this->level_i18n['id'],$this->level['id']);
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
