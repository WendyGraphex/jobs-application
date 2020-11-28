<?php



 class EmployeeStudyLevelI18nForm extends EmployeeStudyLevelI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('level_id', new mfValidatorInteger());
    }
    
 
}


