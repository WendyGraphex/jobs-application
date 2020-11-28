<?php



class EmployeeNotationCriteriaViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('criteria', new EmployeeNotationCriteriaForm($this->getDefault('criteria')));
        $this->embedForm('criteria_i18n', new EmployeeNotationCriteriaI18nForm($this->getDefault('criteria_i18n')));
        $this->criteria->setValidator('category_id',new mfValidatorCHoice(array('key'=>true,'required'=>false,'choices'=> EmployeeNotationCategory::getCategoriesByPositionForSelect()->unshift(array(''=>'')))));
        unset($this->criteria_i18n['id'],$this->criteria['id']);
    }

    function getIcon()
    {
        return $this['criteria']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['criteria']['icon']->hasValue();
    }
    
    function getValuesForCriteria()
    {
        $values= $this['criteria']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForCriteriaI18n()
    {
        return $this['criteria_i18n']->getValue();      
    }
}