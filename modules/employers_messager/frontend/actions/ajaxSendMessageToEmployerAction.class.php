<?php

require_once __DIR__."/../locales/Forms/SendMessageToEmployerForm.class.php";
        
class employers_messager_ajaxSendMessageToEmployerAction extends mfAction {
            
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();  
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
           $this->forwardTo401Action ();
      try 
      {    
          $response = new mfArray(array("action"=>"SendMessageToEmployer"));
          $form = new SendMessageToEmployerForm($this->getUser()->getGuardUser());
          $form->bind($request->getPostParameter('EmployerMessage'));
          if (!$form->isValid())
          {
              $response['errors']=$form->getErrorSchema()->getCodes();
              return $response->toArray();
          }          
          $message = new CustomerEmployerMessage();
          $message->add($form->getValues());
          $message->send();
          
           $engine= new CustomerEmployerMessageEmailEngine($message);
            $engine->send();
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response->toArray();
    }
}

