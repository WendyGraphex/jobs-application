<?php

// www.project55.net/employee/test/AdvertEmail?advert=27&type=Validation
/*
 * Published ok
 * Refused ok
 * Created ok
 * Revival ok
 */
class employees_testAdvertEmailAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       
      $employee_advert= new EmployeeAdvert($request->getGetParameter('advert'));
      if ($employee_advert->isNotLoaded())     
          die("INVALID");      
      $engine = new EmployeeAdvertEmailEngine($employee_advert);
      $method="send".ucfirst($request->getGetParameter('type'));
      if (!method_exists($engine, $method))
         die("TYPE INVALID");
      $engine->getMailer()->debug();   
      $engine->$method();
      die();
    }
}
