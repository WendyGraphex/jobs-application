<?php


class employers_ajaxDashboardAction extends mfAction {
                 
    function execute(mfWebRequest $request) {            
         if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
        $messages = mfMessages::getInstance();                     
    }
       
}


