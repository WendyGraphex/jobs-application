<?php
 
require_once __DIR__."/../locales/Forms/SiteEventUserUnlockForm.class.php";

class site_event_ajaxUnlockAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();   
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEventUser()) 
                $this->forwardTo401Action();
        try 
        {                      
            $form = new SiteEventUserUnlockForm($this->getUser()->getGuardUser());
            $form->bind($request->getPostParameter('SiteEventUserUnlock'));
            if ($form->isValid())
            {               
                $this->getUser()->getGuardUser()->unlock(); 
                $response=array("unlock"=>true,'action'=>'Unlock');
            }  
            else
            {
               // var_dump($form->getErrorSchema()->getErrorsMessage());               
                $response=array('action'=>'Unlock','unlock'=>false,'errors'=>(string)$form['password']->getError()->getCode());
            }               
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


