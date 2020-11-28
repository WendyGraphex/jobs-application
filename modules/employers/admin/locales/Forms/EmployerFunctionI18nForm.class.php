<?php



 class EmployerFunctionI18nForm extends EmployerFunctionI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('function_id', new mfValidatorInteger());
    }
    
 
}


