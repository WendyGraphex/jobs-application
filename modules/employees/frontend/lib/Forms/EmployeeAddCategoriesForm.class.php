<?php

class EmployeeAddCategoriesForm extends mfForm {
    
   
    function configure()
    {
        $this->setValidators(array(            
             'selection'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection')),array('required'=>false)),
        ));        
    }
    
    function getSelection()
    {
        return PartnerWorkCategory::getCategoriesFromSelection($this['selection']->getArray());
    }
       
}

