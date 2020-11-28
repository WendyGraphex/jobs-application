<?php



 class CustomerAcademyLevelI18nForm extends CustomerAcademyLevelI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('level_id', new mfValidatorInteger());
    }
    
 
}


