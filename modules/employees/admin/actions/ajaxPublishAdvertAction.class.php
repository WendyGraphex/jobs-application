<?php


class employees_ajaxPublishAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
        $messages = mfMessages::getInstance();   
        try
        {
            $advert = new EmployeeAdvert($request->getPostParameter('EmployeeAdvert'));  
            if ($advert->isNotLoaded())
                 throw new mfException(__('Job is invalid.'));
            $advert->publish();
            
               $engine = new EmployeeAdvertEmailEngine($advert);
            $engine->sendPublished();
            $messages->addInfo(__('Job is published.'));
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
        $this->forward($this->getModuleName(), 'ajaxListPartialAdvert');
    }

}




