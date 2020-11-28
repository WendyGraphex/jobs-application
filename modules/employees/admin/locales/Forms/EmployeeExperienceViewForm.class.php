<?php



class EmployeeExperienceViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('experience', new EmployeeExperienceForm($this->getDefault('experience')));
        $this->embedForm('experience_i18n', new EmployeeExperienceI18nForm($this->getDefault('experience_i18n')));
        unset($this->experience_i18n['id'],$this->experience['id']);
    }

    function getIcon()
    {
        return $this['experience']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['experience']['icon']->hasValue();
    }
    
    function getValuesForExperience()
    {
        $values= $this['experience']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForExperienceI18n()
    {
        return $this['experience_i18n']->getValue();      
    }
}
