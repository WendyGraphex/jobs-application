<?php


class site_event_order_ExportPdfAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {  
       
      $messages = mfMessages::getInstance();   
        
          $sale_order=new SiteEventOrder($request->getGetParameter('order'));                
          if ($sale_order->isNotLoaded())
             $this->forward404File();    
          
          $pdf=new SiteEventOrderPdf($sale_order);
          if ($request->getGetParameter('debug')=='true')
              $pdf->output();
          else
              $pdf->forceOutput();               
        die();
    }
}
