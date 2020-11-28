<?php

require_once __DIR__."/../locales/Forms/EmployerAdvertI18nMultipleViewForm.class.php";

class employers_ajaxViewAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
        $messages = mfMessages::getInstance();   
        $this->advert = new EmployerAdvert($request->getPostParameter('EmployerAdvert'),$this->getUser()->getGuardUser());        
        $this->form = new EmployerAdvertI18nMultipleViewForm($this->advert,$request->getPostParameter('EmployerAdvertMultiple'));        
    }

}




