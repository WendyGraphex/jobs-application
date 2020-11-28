<?php



 class EmployerLevelI18nForm extends EmployerLevelI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('level_id', new mfValidatorInteger());
    }
    
 
}


