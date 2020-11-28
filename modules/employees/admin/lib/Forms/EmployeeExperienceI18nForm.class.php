<?php



 class EmployeeExperienceI18nForm extends EmployeeExperienceI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('experience_id', new mfValidatorInteger());
    }
 
}


