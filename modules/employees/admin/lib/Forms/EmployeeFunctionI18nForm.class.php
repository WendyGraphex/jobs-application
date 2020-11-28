<?php



 class EmployeeFunctionI18nForm extends EmployeeFunctionI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('function_id', new mfValidatorInteger());
    }
    
 
}


