<?php


 
class EmployerActivityViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('activity', new EmployerActivityBaseForm($this->getDefault('activity')));
        $this->embedForm('activity_i18n', new EmployerActivityI18nForm($this->getDefault('activity_i18n')));
        unset($this->activity_i18n['id'],$this->activity['id']);
    }

    function getIcon()
    {
        return $this['activity']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['activity']['icon']->hasValue();
    }
    
    function getValuesForActivity()
    {
        $values= $this['activity']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForActivityI18n()
    {
        return $this['activity_i18n']->getValue();      
    }
}
