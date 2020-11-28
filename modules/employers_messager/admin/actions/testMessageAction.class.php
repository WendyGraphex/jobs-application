<?php

// www.project55.net/admin/employer/messager/test/Message?employer=17&type=FirstMessage

/*
 * FirstMessage
 */
class employers_messager_testMessageAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       
      $employer_user= new EmployerUser($request->getGetParameter('employer'));
      if ($employer_user->isNotLoaded())     
          die("INVALID");      
      $engine = new EmployerUserMessageEngine($employer_user);
      $method="send".ucfirst($request->getGetParameter('type'));
      if (!method_exists($engine, $method))
         die("TYPE INVALID");
      $engine->debug();   
      $engine->$method();
      die();
    }
}
