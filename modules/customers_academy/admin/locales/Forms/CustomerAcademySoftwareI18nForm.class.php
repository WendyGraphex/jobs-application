<?php



 class CustomerAcademySoftwareI18nForm extends CustomerAcademySoftwareI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('software_id', new mfValidatorInteger());
    }
    
 
}


