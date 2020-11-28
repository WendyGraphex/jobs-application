<?php


class employers_ajaxDisplayAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
        $messages = mfMessages::getInstance();   
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
        $this->advert = new EmployerAdvert($request->getPostParameter('EmployerAdvert'),$this->getUSer()->getGuardUser());                                
    }

}




