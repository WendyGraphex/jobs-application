<?php

// www.project55.net/admin/employer/test/AdvertEmail?advert=27&type=Refused
/*
 * Published ok
 * Refused ok
 * Created ok
 * Revival ok
 */
class employers_testAdvertEmailAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       
      $employer_advert= new EmployerAdvert($request->getGetParameter('advert'));
      if ($employer_advert->isNotLoaded())     
          die("INVALID");      
      $engine = new EmployerAdvertEmailEngine($employer_advert);
      $method="send".ucfirst($request->getGetParameter('type'));
      if (!method_exists($engine, $method))
         die("TYPE INVALID");
      $engine->getMailer()->debug();   
      $engine->$method();
      die();
    }
}
