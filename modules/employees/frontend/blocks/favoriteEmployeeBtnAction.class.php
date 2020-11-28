<?php

 

class employees_favoriteEmployeeBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        if (!$this->getUser()->isEmployee())
            return mfView::NONE;
        $this->favourite=new EmployeeFavourite($this->getParameter('employee_user'),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
    } 
    
    
}
