<?php


class sales_billing_ExportPdfAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
        
          $sale_billing=new SaleBilling($request->getGetParameter('billing'));                
          if ($sale_billing->isNotLoaded())
             $this->forward404File();               
          $pdf=new SaleBillingPdf($sale_billing);
          if ($request->getGetParameter('debug')=='true')
              $pdf->output();
          else
              $pdf->forceOutput();               
        die();
    }
}
