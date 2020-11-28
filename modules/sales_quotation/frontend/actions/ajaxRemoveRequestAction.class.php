<?php

class sales_quotation_ajaxRemoveRequestAction extends mfAction {
    

    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
            $this->forwardTo401Action ();       
        $this->getUSer()->getStorage()->remove('advert_i18n');
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
         
    }
    
   
}


