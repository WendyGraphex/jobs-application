<?php



class emailer_spooler_ajaxViewEmailAction extends mfAction {
    
    
    
   
        
    function execute(mfWebRequest $request) {    
        $messages= mfMessages::getInstance();
        if ($this->getUser()->hasCredential(array(array('superadmin','emailer_spooler'))))
              $this->forwardTo401Action();
        $this->item=new EmailerSpooler($request->getPostParameter('Email'));
   }

}

