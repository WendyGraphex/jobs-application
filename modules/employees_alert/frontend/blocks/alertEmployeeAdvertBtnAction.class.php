<?php

 

class employees_alert_alertEmployeeAdvertBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {             
        if (!$this->getUser()->isEmployee())
            return mfView::NONE;
        $this->alert=new EmployeeAlert($this->getParameter('advert_i18n'),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
    } 
    
    
}
