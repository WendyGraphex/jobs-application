<?php


class employees_ajaxRefuseAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
        $messages = mfMessages::getInstance();   
        try
        {
            $advert = new EmployeeAdvert($request->getPostParameter('EmployeeAdvert'));  
            if ($advert->isNotLoaded())
                 throw new mfException(__('Job is invalid.'));
            $advert->refuse();
            
            $engine = new EmployeeAdvertEmailEngine($advert);
            $engine->sendRefused();
            $messages->addInfo(__('Job is refused.'));
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
        $this->forward($this->getModuleName(), 'ajaxListPartialAdvert');
    }

}




