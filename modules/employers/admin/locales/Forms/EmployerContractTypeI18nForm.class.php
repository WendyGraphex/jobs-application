<?php



 class EmployerContractTypeI18nForm extends EmployerContractTypeI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('type_id', new mfValidatorInteger());
    }
    
 
}


