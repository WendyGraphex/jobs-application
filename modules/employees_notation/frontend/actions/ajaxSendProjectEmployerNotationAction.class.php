<?php
/*
 * Employer => notation sur EmployeeAdvert for Employee
 * 
 */
require_once __DIR__."/../locales/Forms/ProjectEmployerAdvertEmployeeNotationSendForm.class.php";

class employees_notation_ajaxSendProjectEmployerNotationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
            if (!$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
            $response=array('action'=>'ProjectEmployerNotation');
            if (!$request->isMethod('POST') || !$request->getPostParameter('ProjectEmployerReviewNotations') || !$request->isXmlHttpRequest())
                return $response;  
            $project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
            if ($project->isNotLoaded())
                 return array('errors'=>'invalid project');    
             if ($project->hasEmployerNotation())       
                return array('errors'=>'project has notation');       
            $form= new ProjectEmployerAdvertEmployeeNotationSendForm($this->getUser()->getGuardUser(),$project);     
            $form->bind($request->getPostParameter('ProjectEmployerReviewNotations'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getErrorsMessage();
                return $response;
            }  
            
            $form->getEmployeeAdvertI18nNotations()->create();
            
            $project->set('has_employer_notation','YES')->save();
           // $comments_i18n=new EmployeeAdvertCommentI18nCollection();
           // $comments_i18n->create($form->getValues());       
            
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

