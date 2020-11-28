<?php

 

class employers_alert_alertEmployeeBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        if (!$this->getUser()->isEmployerUser())
            return mfView::NONE;
        $this->alert=new EmployerAlert($this->getParameter('employee_user'),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
    } 
    
    
}
