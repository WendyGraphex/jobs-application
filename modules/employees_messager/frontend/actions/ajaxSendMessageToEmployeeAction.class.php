<?php

require_once __DIR__."/../locales/Forms/SendMessageToEmployeeForm.class.php";
        
class employees_messager_ajaxSendMessageToEmployeeAction extends mfAction {
            
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();  
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
           $this->forwardTo401Action ();
      try 
      {    
          $response = new mfArray(array("action"=>"SendMessageToEmployee"));
          $form = new SendMessageToEmployeeForm($this->getUser()->getGuardUser());
          $form->bind($request->getPostParameter('EmployeeMessage'));
          if (!$form->isValid())
          {
              $response['errors']=$form->getErrorSchema()->getCodes();
              return $response->toArray();
          }          
          $message = new CustomerEmployeeMessage();
          $message->add($form->getValues());
          $message->send();
          
           $engine=new CustomerEmployeeMessageEmailEngine($message);
           $engine->send();
           
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response->toArray();
    }
}

