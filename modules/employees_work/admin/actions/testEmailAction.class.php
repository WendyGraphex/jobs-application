<?php

// www.project55.net/admin/employees/work/test/Email?request=529&type=Confirmed


class employees_work_testEmailAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       
      $item= new EmployeeWorkPaymentRequest($request->getGetParameter('request'));
      if ($item->isNotLoaded())     
          die("INVALID");      
      $engine = new EmployeeWorkPaymentRequestEmailEngine($item);
      $method="send".ucfirst($request->getGetParameter('type'));
      if (!method_exists($engine, $method))
         die("TYPE INVALID");
      $engine->getMailer()->debug();   
      $engine->$method();
      die();
    }
}
