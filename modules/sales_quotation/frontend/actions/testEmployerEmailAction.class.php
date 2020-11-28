<?php

// www.project55.net/quotations/employee/test/Email?quotation=16&type=Refused
/*
 * Accepted ok
 * Refused ok
 * Revival ok
 * Negociate ok
 */
class sales_quotation_testEmployerEmailAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       
      $sale_quotation= new SaleEmployeeQuotation($request->getGetParameter('quotation'));
      if ($sale_quotation->isNotLoaded())     
          die("INVALID");      
      $engine = new EmployerSaleQuotationEmailEngine($sale_quotation);
      $method="send".ucfirst($request->getGetParameter('type'));
      if (!method_exists($engine, $method))
         die("TYPE INVALID");
      $engine->getMailer()->debug();   
      $engine->$method();
      die();
    }
}
