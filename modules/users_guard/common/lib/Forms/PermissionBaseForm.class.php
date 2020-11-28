<?php



 class PermissionBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(            
            "id"=>new mfValidatorInteger(),                     
            "name"=> new mfValidatorName(array('required'=>false)),      
            ) 
        );                      
    }
    
 
}


