<?php

// www.project55.net/admin/employee/messager/test/Message?employee=17&type=FirstMessage
/*
 * FirstMessage
 */
class employees_messager_testMessageAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       
      $employee_user= new Employee($request->getGetParameter('employee'));
      if ($employee_user->isNotLoaded())     
          die("INVALID");      
      $engine = new EmployeeUserMessageEngine($employee_user);
      $method="send".ucfirst($request->getGetParameter('type'));
      if (!method_exists($engine, $method))
         die("TYPE INVALID");
      $engine->debug();        
      $engine->$method();          
      die();
    }
}
