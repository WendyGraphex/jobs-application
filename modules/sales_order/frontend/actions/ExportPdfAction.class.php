<?php


class sales_order_ExportPdfAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
          if ($this->getUser()->isAuthenticated() && !$this->getUser()->isEmployerUser())          
             $this->forwardTo401Action();
          $sale_order=new SaleOrder(array('reference'=>$request->getGetParameter('order')),$this->getUser()->getGuardUser());                
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
