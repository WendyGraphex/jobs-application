<?php
/*
 * Employer => comment sur EmployeeAdvert for Employee
 * 
 */
require_once __DIR__."/../locales/Forms/ProjectEmployerCommentSendForm.class.php";

class employees_comment_ajaxSendProjectEmployerCommentAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
            if (!$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
            $response=array('action'=>'ProjectEmployerComment');
            if (!$request->isMethod('POST') || !$request->getPostParameter('ProjectEmployerComment') || !$request->isXmlHttpRequest())
                return $response;  
            $project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
            if ($project->isNotLoaded())
                 return array('errors'=>'invalid project');                                  
            $form= new ProjectEmployerCommentSendForm($this->getUser()->getGuardUser(),$project);     
            $form->bind($request->getPostParameter('ProjectEmployerComment'));
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

