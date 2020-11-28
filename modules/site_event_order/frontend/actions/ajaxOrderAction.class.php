<?php


class site_event_order_ajaxOrderAction extends mfAction {
    
   function execute(mfWebRequest $request) { 
        $messages = mfMessages::getInstance();   
        if (!$this->getUser()->isEventUser())          
             $this->forwardTo401Action();
        $this->order=new SiteEventOrder($request->getPostParameter('SiteEventOrder'),$this->getUser()->getGuardUser());
      }
   
}

