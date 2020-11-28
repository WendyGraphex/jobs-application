<?php

require_once __DIR__."/../locales/Forms/SendMessageForQuotationForm.class.php";
        
class employees_messager_ajaxSendMessageForQuotationAction extends mfAction {
            
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();  
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
           $this->forwardTo401Action ();
      try 
      {    
          $response = new mfArray(array("action"=>"SendMessageForQuotation"));
          $form = new SendMessageForQuotationForm($this->getUser()->getGuardUser());
          $form->bind($request->getPostParameter('EmployeeMessage'));
          if (!$form->isValid())
          {
              $response['errors']=$form->getErrorSchema()->getCodes();
              return $response->toArray();
          }          
           $message = new CustomerEmployeeMessage();
           $message->add($form->getValues());
           $message->send();
           $response['dialog']=__("Message has been sent to %s",(string)$message->getEmployerUser());
           
           $engine=new CustomerEmployeeMessageEmailEngine($message);
           $engine->send();
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response->toArray();
    }
}


