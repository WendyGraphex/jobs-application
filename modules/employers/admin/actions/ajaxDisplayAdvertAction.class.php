<?php


class employers_ajaxDisplayAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
        $messages = mfMessages::getInstance();   
        $this->advert = new EmployerAdvert($request->getPostParameter('EmployerAdvert'));                                
    }

}




