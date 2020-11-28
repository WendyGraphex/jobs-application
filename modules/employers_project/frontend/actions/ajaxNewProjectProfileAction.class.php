<?php

require_once __DIR__."/../locales/Forms/EmployerProjectI18nMultipleNewForm.class.php";

class employers_project_ajaxNewProjectProfileAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
       if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance();         
         $response=array('action'=>'NewProject');
        $form = new EmployerProjectI18nMultipleNewForm($this->getUser()->getGuardUser(),$request->getPostParameter('EmployerProjectMultiple'));                            
        $form->bind($request->getPostParameter('EmployerProjectMultiple'));
        if ($form->isValid())
        {
           //$this->form->getProject()->create();           
                       
          // $messages->addInfo(__('Project has been created.'));          
         //  $this->forward($this->getModuleName(), 'ajaxListPartialProject');
           $response['status']="OK";
        }   
        else
        {
            $response['errors']=$form->getErrorSchema()->getErrorsMessage(); 
        } 
         return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}




