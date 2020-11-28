<?php


class sales_order_ajaxDisplayOrderAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {
            $messages = mfMessages::getInstance();       
            $this->order=new SaleOrder($request->getPostParameter('SaleOrder'));        
    }
    
}