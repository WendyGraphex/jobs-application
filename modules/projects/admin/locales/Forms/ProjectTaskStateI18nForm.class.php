<?php



 class ProjectTaskStateI18nForm extends ProjectTaskStateI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('state_id', new mfValidatorInteger());
    }
    
 
}


