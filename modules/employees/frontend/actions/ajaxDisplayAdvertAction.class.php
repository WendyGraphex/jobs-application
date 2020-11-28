<?php


class employees_ajaxDisplayAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
        $messages = mfMessages::getInstance();   
        $this->advert = new EmployeeAdvert($request->getPostParameter('EmployeeAdvert'));                                
    }

}




