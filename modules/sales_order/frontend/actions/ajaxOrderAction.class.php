<?php


class sales_order_ajaxOrderAction extends mfAction {
    
   function execute(mfWebRequest $request) { 
        $messages = mfMessages::getInstance();   
        if ($this->getUser()->isAuthenticated() && !$this->getUser()->isEmployerUser())          
             $this->forwardTo401Action();
        $this->order=new SaleOrder($request->getPostParameter('SaleOrder'),$this->getUser()->getGuardUser());
      }
   
}

