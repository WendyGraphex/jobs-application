<?php

// www.project55.net/admin/payments/employer/test/Email?payment=529&type=Confirmed


class payments_employer_testEmailAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       
      $item= new PaymentEmployerUser($request->getGetParameter('payment'));
      if ($item->isNotLoaded())     
          die("INVALID");      
      $engine = new PaymentEmployerEmailEngine($item);
      $method="send".ucfirst($request->getGetParameter('type'));
      if (!method_exists($engine, $method))
         die("TYPE INVALID");
      $engine->getMailer()->debug();   
      $engine->$method();
      die();
    }
}
