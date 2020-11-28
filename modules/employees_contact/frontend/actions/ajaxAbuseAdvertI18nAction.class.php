<?php

require_once __DIR__."/../locales/Forms/EmployeeAbuseAdvertI18nForm.class.php";

class employees_contact_ajaxAbuseAdvertI18nAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
         $messages = mfMessages::getInstance();            
          try 
        {                     
            $response=array('action'=>'AbuseAdvertI18n');
            $form= new EmployeeAbuseAdvertI18nForm();
            $form->bind($request->getPostParameter('EmployeeAdvertI18nAbuse'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getCodes();
                return $response;
            }   
            $share= new EmployeeAdvertI18nAbuse();            
            $share->add($form->getValues());
            if ($this->getUser()->isAuthenticated())
            {        
                $share->set('employee_user_id',$this->getUser()->isEmployee()?$this->getUser()->getGuardUser():null) ;
                $share->set('employer_user_id',$this->getUser()->isEmployerUser()?$this->getUser()->getGuardUser():null) ;
            }            
            $share->create();
            
            $engine= new EmployeeAdvertI18nAbuseEmailEngine($share);
            $engine->sendAbuseToContactAndRecipients();
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response; 
    }

}





