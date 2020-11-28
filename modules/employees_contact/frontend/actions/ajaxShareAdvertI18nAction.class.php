<?php

require_once __DIR__."/../locales/Forms/EmployeeShareAdvertI18nForm.class.php";

class employees_contact_ajaxShareAdvertI18nAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
         $messages = mfMessages::getInstance();            
          try 
        {                     
            $response=array('action'=>'ShareAdvertI18n');
            $form= new EmployeeShareAdvertI18nForm();
            $form->bind($request->getPostParameter('EmployeeAdvertI18nShare'));
            if (!$form->isValid())
            {
                $response['errors']=$form->getErrorSchema()->getCodes();
                return $response;
            }   
            $share= new EmployeeAdvertI18nShare();            
            $share->add($form->getValues());
            if ($this->getUser()->isAuthenticated())
            {        
                $share->set('employee_user_id',$this->getUser()->isEmployee()?$this->getUser()->getGuardUser():null) ;
                $share->set('employer_user_id',$this->getUser()->isEmployerUser()?$this->getUser()->getGuardUser():null) ;
            }            
            $share->create();
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response; 
    }

}





