<?php

// www.project55.net/employer/test/Email?employer=17&type=Congratulations

/*
 * Congratulations
 */
class employers_testEmailAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       
      $employer_user= new Employee($request->getGetParameter('employer'));
      if ($employer_user->isNotLoaded())     
          die("INVALID");      
      $engine = new EmployeeEmailEngine($employer_user);
      $method="send".ucfirst($request->getGetParameter('type'));
      if (!method_exists($engine, $method))
         die("TYPE INVALID");
      $engine->getMailer()->debug();   
      $engine->$method();
      die();
    }
}
