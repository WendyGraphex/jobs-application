<?php



class EmployeeSkillViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('skill', new EmployeeSkillForm($this->getDefault('skill')));
        $this->embedForm('skill_i18n', new EmployeeSkillI18nForm($this->getDefault('skill_i18n')));
        unset($this->skill_i18n['id'],$this->skill['id']);
    }

    function getIcon()
    {
        return $this['skill']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['skill']['icon']->hasValue();
    }
    
   function getPicture()
    {
        return $this['skill']['picture']->getValue();
    }
    
    function hasPicture()
    {
        return $this['skill']['picture']->hasValue();
    }
    
    function getValuesForSkill()
    {
        $values= $this['skill']->getValue();
        unset($values['icon'],$values['picture']);
        return $values;
    }
    
    function getValuesForSkillI18n()
    {
        return $this['skill_i18n']->getValue();      
    }
}
