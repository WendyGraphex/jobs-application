<?php

// www.project41.net/employee/admin/test

class employees_testAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
         
        $employee=new Employee(11);
        $engine = new EmployeeEmailEngine($employee);        
        $engine->sendValidation();
         die(__METHOD__);
    }
    
   
}


