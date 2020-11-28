<?php


class site_event_ajaxRefuseEventAction extends mfAction
{

    function execute(mfWebRequest $request)
    {         
        $messages = mfMessages::getInstance();   
        try
        {
            if (!$this->getUser()->isEventUser())             
                $this->forwardTo401Action();
             $event = new SiteEvent($request->getPostParameter('SiteEvent'),$this->getUser()->getGuardUser());  
            if ($event->isNotLoaded())
                 throw new mfException(__('Event is invalid.'));
            $event->refuse();
            
          //   $engine = new EmployeeAdvertI18nEmailEngine($course_i18n);
          //  $engine->sendRefused();
          $response=array(
                         'action'=>'RefuseEvent',
                         'info'=>__('Event is refused.')
                        );
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response; 
    }

}




