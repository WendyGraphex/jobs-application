<?php


class sales_order_ExportPdfAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {  
       
      $messages = mfMessages::getInstance();   
        
          $sale_order=new SaleOrder($request->getGetParameter('order'));                
          if ($sale_order->isNotLoaded())
             $this->forward404File();    
          
          $pdf=new SaleOrderPdf($sale_order);
          if ($request->getGetParameter('debug')=='true')
              $pdf->output();
          else
              $pdf->forceOutput();               
        die();
    }
}
