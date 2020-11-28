<?php

// www.project55.net/employer/test/Email?employer=17&type=Congratulations

/*
 * Congratulations
 */
class customers_academy_teacher_testEmailAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       
      $user= new Employee($request->getGetParameter('user'));
      if ($user->isNotLoaded())     
          die("INVALID");      
      $engine = new CustomerAcademyTeacherUserEmailEngine($user);
      $method="send".ucfirst($request->getGetParameter('type'));
      if (!method_exists($engine, $method))
         die("TYPE INVALID");
      $engine->getMailer()->debug();   
      $engine->$method();
      die();
    }
}
