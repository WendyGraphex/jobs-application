<?php
/*
 * Employee => notation sur EmployeeAdvert for Employer
 * 
 */
require_once __DIR__."/../locales/Forms/ProjectEmployeeAdvertEmployerNotationSendForm.class.php";

class employees_notation_ajaxSendProjectEmployeeNotationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       try
       {
            if (!$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
            $response=array('action'=>'ProjectEmployeeNotation');
            if (!$request->isMethod('POST') || !$request->getPostParameter('ProjectEmployeeReviewNotations') || !$request->isXmlHttpRequest())
                return $response;  
            $project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
            if ($project->isNotLoaded())
                 return array('errors'=>'invalid project');   
            if ($project->hasEmployeeNotation())       
                return array('errors'=>'project has notation');       
            $form= new ProjectEmployeeAdvertEmployerNotationSendForm($this->getUser()->getGuardUser(),$project);     
            $form->bind($request->getPostParameter('ProjectEmployeeReviewNotations'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getErrorsMessage();
                return $response;
            }  
            
           $form->getEmployeeAdvertI18nNotations()->create();
           $project->set('has_employee_notation','YES')->save();
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

