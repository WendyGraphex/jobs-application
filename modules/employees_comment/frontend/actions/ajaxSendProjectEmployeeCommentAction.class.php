<?php
/*
 * Employee => comment sur EmployeeAdvert for Employer
 * 
 */
require_once __DIR__."/../locales/Forms/ProjectEmployeeCommentSendForm.class.php";

class employees_comment_ajaxSendProjectEmployeeCommentAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
            if (!$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
            $response=array('action'=>'ProjectEmployeeComment');
            if (!$request->isMethod('POST') || !$request->getPostParameter('ProjectEmployeeComment') || !$request->isXmlHttpRequest())
                return $response;  
            $project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
            if ($project->isNotLoaded())
                 return array('errors'=>'invalid project');                                  
            $form= new ProjectEmployeeCommentSendForm($this->getUser()->getGuardUser(),$project);     
            $form->bind($request->getPostParameter('ProjectEmployeeComment'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getErrorsMessage();
                return $response;
            }    
            $comments_i18n=new EmployeeAdvertCommentI18nCollection();
            $comments_i18n->create($form->getValues());       
            
          /*  $engine= new EmployeeCommentEmailEngine($comments_i18n,$this->getUser()->getEmployerUser());
            $engine->sendRequestToContactAndRecipients();*/
             
            $response['status']='OK';
       } 
       catch (mfException $ex) {
           $response['error']=$ex->getMessage();
       }                         
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

