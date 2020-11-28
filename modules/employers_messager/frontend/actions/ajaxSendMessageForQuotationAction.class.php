<?php

require_once __DIR__."/../locales/Forms/SendMessageForQuotationForm.class.php";
        
class employers_messager_ajaxSendMessageForQuotationAction extends mfAction {
            
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();  
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
           $this->forwardTo401Action ();
      try 
      {    
          $response = new mfArray(array("action"=>"SendMessageForQuotation"));
          $form = new SendMessageForQuotationForm($this->getUser()->getGuardUser());
          $form->bind($request->getPostParameter('EmployerMessage'));
          if (!$form->isValid())
          {
              $response['errors']=$form->getErrorSchema()->getCodes();
              return $response->toArray();
          }          
           $message = new CustomerEmployerMessage();
           $message->add($form->getValues());
           $message->send();
           $response['dialog']=__("Message has been sent to %s",(string)$message->getEmployeeUser());
           
             $engine= new CustomerEmployerMessageEmailEngine($message);
            $engine->send();
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response->toArray();
    }
}


