<?php



 class EmployerLanguageLevelI18nForm extends EmployerLanguageLevelI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('level_id', new mfValidatorInteger());
    }
    
 
}


