<?php

require_once __DIR__."/../locales/Forms/EmployerAbuseAdvertI18nForm.class.php";

class employers_contact_ajaxAbuseAdvertI18nAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
         $messages = mfMessages::getInstance();            
          try 
        {                     
            $response=array('action'=>'AbuseAdvertI18n');
            $form= new EmployerAbuseAdvertI18nForm();
            $form->bind($request->getPostParameter('EmployerAdvertI18nAbuse'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getCodes();
                return $response;
            }   
            $share= new EmployerAdvertI18nAbuse();            
            $share->add($form->getValues());
            if ($this->getUser()->isAuthenticated())
            {        
                $share->set('employee_user_id',$this->getUser()->isEmployee()?$this->getUser()->getGuardUser():null) ;
                $share->set('employer_user_id',$this->getUser()->isEmployerUser()?$this->getUser()->getGuardUser():null) ;
            }            
            $share->create();
            
             $engine= new EmployerAdvertI18nAbuseEmailEngine($share);
            $engine->sendAbuseToContactAndRecipients();
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response; 
    }

}





