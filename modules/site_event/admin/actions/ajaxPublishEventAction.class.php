<?php


class site_event_ajaxPublishEventAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
        $messages = mfMessages::getInstance();   
        try
        {
            $event = new SiteEvent($request->getPostParameter('SiteEvent'));  
            if ($event->isNotLoaded())
                 throw new mfException(__('Event is invalid.'));
            $event->publish();    
          //  $engine = new EmployeeAdvertI18nEmailEngine($course_i18n);
          //  $engine->sendPublished();
            
            $response=array(
                         'action'=>'PublishEvent',
                         'info'=>__('Event is published.')
                        );
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}




