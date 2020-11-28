<?php

class sales_quotation_ajaxRemoveOfferAction extends mfAction {
    

    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
            $this->forwardTo401Action ();       
        $this->getUser()->getStorage()->remove('advert_i18n');
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
         
    }
    
   
}


