<?php

 

class employers_favoriteEmployerBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        if (!$this->getUser()->isEmployerUser())
            return mfView::NONE;
        $this->favourite=new EmployerFavourite($this->getParameter('employer_user'),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
    } 
    
    
}
