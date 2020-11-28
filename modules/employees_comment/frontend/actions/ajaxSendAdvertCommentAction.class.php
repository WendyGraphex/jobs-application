<?php

require_once __DIR__."/../locales/Forms/EmployeeAdvertCommentSendForm.class.php";

class employees_comment_ajaxSendAdvertCommentAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
            if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
            $response=array('action'=>'SendAdvertComment');
            if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeAdvertComment') || !$request->isXmlHttpRequest())
                return $response;  
            $form= new EmployeeAdvertCommentSendForm($this->getUser());     
            $form->bind($request->getPostParameter('EmployeeAdvertComment'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getErrorsMessage();
                return $response;
            }    
            
            $comments_i18n=new EmployeeAdvertCommentI18nCollection();
            $comments_i18n->create($form->getValues());       
            
            $engine= new EmployeeCommentEmailEngine($comments_i18n,$this->getUser()->getEmployerUser());
            $engine->sendRequestToContactAndRecipients();
             
            $response['status']='OK';
       } 
       catch (mfException $ex) {
           $response['error']=$ex->getMessage();
       }                         
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

