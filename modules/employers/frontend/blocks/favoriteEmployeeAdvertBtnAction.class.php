<?php

 

class employers_favoriteEmployeeAdvertBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        if (!$this->getUser()->isEmployerUser())
            return mfView::NONE;
        $this->favourite=new EmployerFavourite($this->getParameter('advert_i18n'),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
    } 
    
    
}
