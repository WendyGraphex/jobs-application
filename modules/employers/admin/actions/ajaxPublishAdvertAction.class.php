<?php


class employers_ajaxPublishAdvertAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
        $messages = mfMessages::getInstance();   
        try
        {
            $advert = new EmployerAdvert($request->getPostParameter('EmployerAdvert'));  
            if ($advert->isNotLoaded())
                 throw new mfException(__('Job is invalid.'));
            $advert->publish();
            $messages->addInfo(__('Job is published.'));
            
            $engine = new EmployerAdvertEmailEngine($advert);
            $engine->sendPublished();
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
        $this->forward($this->getModuleName(), 'ajaxListPartialAdvert');
    }

}




