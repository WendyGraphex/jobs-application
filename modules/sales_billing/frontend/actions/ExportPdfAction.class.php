<?php


class sales_billing_ExportPdfAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
         if ($this->getUser()->isAuthenticated() && !$this->getUser()->isEmployerUser())          
             $this->forwardTo401Action();     
        
          $payment=new PaymentEmployerUser(array('reference'=>$request->getGetParameter('payment')),$this->getUser()->getGuardUser());           
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
