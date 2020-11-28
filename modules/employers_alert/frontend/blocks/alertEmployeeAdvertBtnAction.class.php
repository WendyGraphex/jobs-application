<?php

 

class employers_alert_alertEmployeeAdvertBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {             
        if (!$this->getUser()->isEmployerUser())
            return mfView::NONE;
        $this->alert=new EmployerAlert($this->getParameter('advert_i18n'),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
    } 
    
    
}
