<?php



class SiteWarningViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('warning', new SiteWarningForm($this->getDefault('warning')));
        $this->embedForm('warning_i18n', new SiteWarningI18nForm($this->getDefault('warning_i18n')));
        unset($this->warning_i18n['id'],$this->warning['id']);
    }

    function getIcon()
    {
        return $this['warning']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['warning']['icon']->hasValue();
    }
    
    function getValuesForWarning()
    {
        $values= $this['warning']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForWarningI18n()
    {
        return $this['warning_i18n']->getValue();      
    }
}
