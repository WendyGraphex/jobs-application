<?php


 class EmployeeAdvertBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                                    
          
        ));
    }
    
 
}


