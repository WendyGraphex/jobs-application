<?php

require_once __DIR__."/../locales/Forms/EmployeeInvitationSendMessageForm.class.php";

class employees_invitation_ajaxSendMessageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
            $response=array('action'=>'SendInvitation');
            if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeInvitation') || !$request->isXmlHttpRequest())
                return $response;  
            $form= new EmployeeInvitationSendMessageForm();     
            $form->bind($request->getPostParameter('EmployeeInvitation'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getErrorsMessage();
                return $response;
            }    
            $contact=new EmployeeInvitation();
            $contact->add($form->getValues());           
            $contact->save();    
            
            $response['status']='OK';
            
            $engine= new EmployeeInvitationEmailEngine($contact);
            $engine->sendRequestToContact();
            $engine->sendRequestToRecipients();           
       } 
       catch (mfException $ex) {
           $response['error']=$ex->getMessage();
       }                         
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

