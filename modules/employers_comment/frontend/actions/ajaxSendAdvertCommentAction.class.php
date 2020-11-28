<?php

require_once __DIR__."/../locales/Forms/EmployerAdvertCommentSendForm.class.php";

class employers_comment_ajaxSendAdvertCommentAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
           if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
            $response=array('action'=>'SendComment');
            if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerAdvertComment') || !$request->isXmlHttpRequest())
                return $response;  
            $form= new EmployerAdvertCommentSendForm($this->getUser());     
            $form->bind($request->getPostParameter('EmployerAdvertComment'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getErrorsMessage();
                return $response;
            }  
            
            $comments_i18n=new EmployerAdvertCommentI18nCollection();
            $comments_i18n->create($form->getValues());         
           
            //  $engine= new CustomerContactEmailEngine($contact);
          //  $engine->sendContactRequestToCustomerAndRecipients();
            $response['status']='OK';
       } 
       catch (mfException $ex) {
           $response['error']=$ex->getMessage();
       }                         
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

