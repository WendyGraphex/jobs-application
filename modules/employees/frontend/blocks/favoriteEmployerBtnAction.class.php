<?php

 

class employees_favoriteEmployerBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        if (!$this->getUser()->isEmployee())
            return mfView::NONE;
        $this->favourite=new EmployeeFavourite($this->getParameter('employer_user'),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
    } 
    
    
}
