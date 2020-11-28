<?php

 

class employees_favoriteEmployerAdvertBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {             
        if (!$this->getUser()->isEmployee())
            return mfView::NONE;
        $this->favourite=new EmployeeFavourite($this->getParameter('advert_i18n'),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
    } 
    
    
}
