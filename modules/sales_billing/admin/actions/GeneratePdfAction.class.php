<?php


class sales_billing_GeneratePdfAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
        
          $payment=new PaymentEmployerUser($request->getGetParameter('payment'));                
          if ($payment->isNotLoaded())
             $this->forward404File();    
          if (!$payment->isAccepted())
              $this->forwardTo401Action();             
          
          $sale_billing=new SaleBilling($payment);
          $sale_billing->generate();
          
          $pdf=new SaleBillingPdf($sale_billing);
          if ($request->getGetParameter('debug')=='true')
              $pdf->output();
          else
              $pdf->forceOutput();               
        die();
    }
}
