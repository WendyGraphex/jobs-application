<?php

 

class employees_alert_alertEmployeeBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        if (!$this->getUser()->isEmployee())
            return mfView::NONE;
        $this->alert=new EmployeeAlert($this->getParameter('employee_user'),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
    } 
    
    
}
