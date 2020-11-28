<?php

 

class employers_favoriteEmployeeBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        if (!$this->getUser()->isEmployerUser())
            return mfView::NONE;
        $this->favourite=new EmployerFavourite($this->getParameter('employee_user'),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
    } 
    
    
}
