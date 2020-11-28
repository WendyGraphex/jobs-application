<?php

// www.project55.net/admin/payments/employee/test/Email?payment=529&type=Confirmed


class payments_employee_testEmailAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       
      $item= new PaymentEmployee($request->getGetParameter('payment'));
      if ($item->isNotLoaded())     
          die("INVALID");      
      $engine = new PaymentEmployeeEmailEngine($item);
      $method="send".ucfirst($request->getGetParameter('type'));
      if (!method_exists($engine, $method))
         die("TYPE INVALID");
      $engine->getMailer()->debug();   
      $engine->$method();
      die();
    }
}
