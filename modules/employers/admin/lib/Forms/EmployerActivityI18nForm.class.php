<?php



 class EmployerActivityI18nForm extends EmployerActivityI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('activity_id', new mfValidatorInteger());
    }
    
 
}


