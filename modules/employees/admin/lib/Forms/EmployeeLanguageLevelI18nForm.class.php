<?php



 class EmployeeLanguageLevelI18nForm extends EmployeeLanguageLevelI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('level_id', new mfValidatorInteger());
    }
    
 
}


