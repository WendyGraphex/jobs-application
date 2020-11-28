<?php


class payments_PaymentAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {
         if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_customer_user_redirect_login')));
        $messages = mfMessages::getInstance(); 
        try
        {
            
            /*$billing = new CustomerContractBilling($request->getGetParameter('Billing'));
            if ($billing->isNotLoaded())
                throw new mfException(__('Billing is invalid'));
            
            $this->customer_payment= new PaymentCustomerUser();
            $this->customer_payment->createFromBillingForMethod('mercanet',$billing,$this->getUser()->getGuardUser(),$request->getIP()); */        
           
        }
        catch (mfException $e)
        {
            $messages->addError($e);           
        }        
    }
   
}

