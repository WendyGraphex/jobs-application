<?php


class site_event_cart_ajaxStatisticsAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        
    }
    
}
