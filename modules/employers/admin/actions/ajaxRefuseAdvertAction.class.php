<?php


class employers_ajaxRefuseAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
        $messages = mfMessages::getInstance();   
        try
        {
            $advert = new EmployerAdvert($request->getPostParameter('EmployerAdvert'));  
            if ($advert->isNotLoaded())
                 throw new mfException(__('Job is invalid.'));
            $advert->refuse();
            
            $engine = new EmployerAdvertEmailEngine($advert);
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




