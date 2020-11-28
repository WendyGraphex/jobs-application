<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyContactSendMessageForm.class.php";

class customers_academy_ajaxSendMessageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
            $response=array('action'=>'SendMesage');
            if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerAcademyContactMessage') || !$request->isXmlHttpRequest())
                return $response;  
            $form= new CustomerAcademyContactSendMessageForm();     
            $form->bind($request->getPostParameter('CustomerAcademyContactMessage'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getErrorsMessage();
                return $response;
            }    
            $contact=new CustomerAcademyContact();
            $contact->add($form->getValues());           
            $contact->save();    
            //  $engine= new CustomerAcademyContactEmailEngine($contact);
          //  $engine->sendContactRequestToCustomerAndRecipients();
            $response['status']='OK';
       } 
       catch (mfException $ex) {
           $response['error']=$ex->getMessage();
       }                         
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

