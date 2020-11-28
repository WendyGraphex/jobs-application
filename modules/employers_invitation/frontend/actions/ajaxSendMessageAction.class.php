<?php

require_once __DIR__."/../locales/Forms/EmployerInvitationSendMessageForm.class.php";

class employers_invitation_ajaxSendMessageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
            $response=array('action'=>'SendInvitation');
            if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerInvitation') || !$request->isXmlHttpRequest())
                return $response;  
            $form= new EmployerInvitationSendMessageForm();     
            $form->bind($request->getPostParameter('EmployerInvitation'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getErrorsMessage();
                return $response;
            }    
            $contact=new EmployerInvitation();
            $contact->add($form->getValues());           
            $contact->save();    
            
            $response['status']='OK';
            
            $engine= new EmployerInvitationEmailEngine($contact);
            $engine->sendRequestToContact();
            $engine->sendRequestToRecipients();           
       } 
       catch (mfException $ex) {
           $response['error']=$ex->getMessage();
       }                         
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

