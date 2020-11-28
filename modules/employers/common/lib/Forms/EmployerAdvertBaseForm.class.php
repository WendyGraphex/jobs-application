<?php


 class EmployerAdvertBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                                    
          
        ));
    }
    
 
}


