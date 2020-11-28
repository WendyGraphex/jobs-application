<?php

require_once __DIR__."/../locales/Forms/EmployeeContactSendMessageForm.class.php";

class employees_contact_ajaxSendMessageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
            $response=array('action'=>'SendMesage');
            if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeContactMessage') || !$request->isXmlHttpRequest())
                return $response;  
            $form= new EmployeeContactSendMessageForm();     
            $form->bind($request->getPostParameter('EmployeeContactMessage'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getErrorsMessage();
                return $response;
            }    
            $contact=new EmployeeContact();
            $contact->add($form->getValues());           
            $contact->save();   
            
            $engine= new EmployeeContactEmailEngine($contact);
            $engine->sendRequestToContactAndRecipients(); 
            $response['status']='OK';
       } 
       catch (mfException $ex) {
           $response['error']=$ex->getMessage();
       }                         
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

