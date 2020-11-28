<?php


class employees_work_refusedRequestEmployerAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {          
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_signin')));
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();                
        $this->payment_request = new  EmployeeWorkPaymentRequest(array('reference'=>$request->getGetParameter('payment')),$this->getUser()->getGuardUser());         
        if ($this->payment_request->isNotLoaded())
            return ;
        if (!$this->payment_request->getStatus()->isActive())
            return ;        
        try 
        {           
               $this->payment_request->getStatus()->refused();
               $engine =  new EmployeeWorkPaymentRequestEmailEngine($this->payment_request);
               $engine->sendRefused();
                                                            
               $request->addRequestParameter('project',$this->payment_request->getWork()->getProject()) ;
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }              
    }
    
}
