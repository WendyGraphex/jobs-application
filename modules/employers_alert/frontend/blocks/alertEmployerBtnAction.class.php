<?php

 

class employers_alert_alertEmployerBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        if (!$this->getUser()->isEmployerUser())
            return mfView::NONE;
        $this->alert=new EmployerAlert($this->getParameter('employer_user'),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
    } 
    
    
}
