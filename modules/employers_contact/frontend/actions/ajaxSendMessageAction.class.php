<?php

require_once __DIR__."/../locales/Forms/EmployerContactSendMessageForm.class.php";

class employers_contact_ajaxSendMessageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
            $response=array('action'=>'SendMesage');
            if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerContactMessage') || !$request->isXmlHttpRequest())
                return $response;  
            $form= new EmployerContactSendMessageForm();     
            $form->bind($request->getPostParameter('EmployerContactMessage'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getErrorsMessage();
                return $response;
            }    
            $contact=new EmployerContact();
            $contact->add($form->getValues());           
            $contact->save();     
             $engine= new EmployerContactEmailEngine($contact);
            $engine->sendRequestToContactAndRecipients();
            $response['status']='OK';
       } 
       catch (mfException $ex) {
           $response['error']=$ex->getMessage();
       }                         
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

