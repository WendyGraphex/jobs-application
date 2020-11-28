<?php



class SiteHelpViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('help', new SiteHelpForm($this->getDefault('help')));
        $this->embedForm('help_i18n', new SiteHelpI18nForm($this->getDefault('help_i18n')));
        unset($this->help_i18n['id'],$this->help['id']);
    }

    function getIcon()
    {
        return $this['help']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['help']['icon']->hasValue();
    }
    
    function getValuesForHelp()
    {
        $values= $this['help']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForHelpI18n()
    {
        return $this['help_i18n']->getValue();      
    }
}
