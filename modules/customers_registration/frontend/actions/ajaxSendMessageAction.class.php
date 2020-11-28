<?php

require_once __DIR__."/../locales/Forms/CustomerRegistrationSendMessageForm.class.php";

class customers_registration_ajaxSendMessageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
            $response=array('action'=>'SendRegistration');
            if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerRegistration') || !$request->isXmlHttpRequest())
                return $response;  
            $form= new CustomerRegistrationSendMessageForm();     
            $form->bind($request->getPostParameter('CustomerRegistration'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getErrorsMessage();
                return $response;
            }    
            $contact=new CustomerRegistration();
            $contact->add($form->getValues());           
            $contact->save();    
            
            $response['status']='OK';
            
            $engine= new CustomerRegistrationEmailEngine($contact);
            $engine->sendRequestToContact();
            $engine->sendRequestToRecipients();           
       } 
       catch (mfException $ex) {
           $response['error']=$ex->getMessage();
       }                         
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

