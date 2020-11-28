<?php

// www.project55.net/employee/test/Email?employee=17&type=Congratulations

/*
 * Congratulations
 */
class employees_testEmailAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       
      $employee= new Employee($request->getGetParameter('employee'));
      if ($employee->isNotLoaded())     
          die("INVALID");      
      $engine = new EmployeeEmailEngine($employee);
      $method="send".ucfirst($request->getGetParameter('type'));
      if (!method_exists($engine, $method))
         die("TYPE INVALID");
      $engine->getMailer()->debug();   
      $engine->$method();
      die();
    }
}
