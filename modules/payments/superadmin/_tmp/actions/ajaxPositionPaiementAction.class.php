<?php

class payments_ajaxPositionpaymentAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';
    
    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();           
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);  
        $this->forwardIf(!$site,"sites","Admin");   // Save, Cancel, User 
        try {
            $this->payments = paymentUtils::getPositionpayments($site);                     
        } catch (mfException $e) {
            $messages->addError($e);
        }
        
    }

}

