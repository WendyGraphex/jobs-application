<?php

 

class employees_alert_alertEmployerBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        if (!$this->getUser()->isEmployee())
            return mfView::NONE;
        $this->alert=new EmployeeAlert($this->getParameter('employer_user'),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
    } 
    
    
}
