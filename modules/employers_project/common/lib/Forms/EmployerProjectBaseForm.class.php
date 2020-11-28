<?php


 class EmployerProjectBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                                    
           
        ));
    }
    
 
}


