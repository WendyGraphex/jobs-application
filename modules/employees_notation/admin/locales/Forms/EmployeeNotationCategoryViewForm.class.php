<?php



class EmployeeNotationCategoryViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('category', new EmployeeNotationCategoryForm($this->getDefault('category')));
        $this->embedForm('category_i18n', new EmployeeNotationCategoryI18nForm($this->getDefault('category_i18n')));
        unset($this->category_i18n['id'],$this->category['id']);
    }

    function getIcon()
    {
        return $this['category']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['category']['icon']->hasValue();
    }
    
    function getValuesForCategory()
    {
        $values= $this['category']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForCategoryI18n()
    {
        return $this['category_i18n']->getValue();      
    }
}
