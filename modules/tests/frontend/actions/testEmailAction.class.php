<?php

// www.project55.net/tests/emails/Email?engine=EmployeeWorkPaymentRequestEmail&type=Refused&class=EmployeeWorkPaymentRequest&id=1&id1=true


class tests_testEmailAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       
      $class= $request->getGetParameter('class');
      if (!class_exists($class))
          die("INVALID OBJECT");      
      $item= new $class($request->getGetParameter('id'));
      if ($item->isNotLoaded())     
          die("INVALID DATA");  
      if ($request->getGetParameter('id1'))
      {    
         $class1= $request->getGetParameter('class1');
        if (!class_exists($class))
           die("INVALID OBJECT1");      
        $item1= new $class1($request->getGetParameter('id1'));
        if ($item1->isNotLoaded())     
            die("INVALID DATA1");  
      }
      $engine_class=$request->getGetParameter('engine')."Engine";
      if (!class_exists($engine_class))
          die("INVALID ENGINE");   
      $engine = new $engine_class($item);
      $method="send".ucfirst($request->getGetParameter('type'));
      if (!method_exists($engine, $method))
         die("ENGINE INVALID");
      $engine->getMailer()->debug();   
      if ($request->getGetParameter('id1'))
         $engine->$method($item1);
      else
         $engine->$method(); 
      die();
    }
}
