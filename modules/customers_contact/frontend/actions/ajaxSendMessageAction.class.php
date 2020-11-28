<?php

require_once __DIR__."/../locales/Forms/CustomerContactSendMessageForm.class.php";

class customers_contact_ajaxSendMessageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
            $response=array('action'=>'SendMesage');
            if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerContactMessage') || !$request->isXmlHttpRequest())
                return $response;  
            $form= new CustomerContactSendMessageForm();     
            $form->bind($request->getPostParameter('CustomerContactMessage'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getErrorsMessage();
                return $response;
            }    
            $contact=new CustomerContact();
            $contact->add($form->getValues());           
            $contact->save();    
            $response['status']='OK';
            
            $engine= new CustomerContactEmailEngine($contact);
            $engine->sendRequestToContactAndRecipients();
       } 
       catch (mfException $ex) {
           $response['error']=$ex->getMessage();
       }                         
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

