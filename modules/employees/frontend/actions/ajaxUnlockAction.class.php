<?php
 
require_once __DIR__."/../locales/Forms/EmployeeUserUnlockForm.class.php";

class employees_ajaxUnlockAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {  
             if (!$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
            $form = new EmployeeUserUnlockForm($this->getUser()->getGuardUser());
            $form->bind($request->getPostParameter('EmployeeUserUnlock'));
            if ($form->isValid())
            {               
                $this->getUser()->getGuardUser()->unlock(); 
                $response=array("unlock"=>true,'action'=>'Unlock');
            }  
            else
            {
             //  var_dump($form->getErrorSchema()->getErrorsMessage());
                $response=array('action'=>'Unlock','unlock'=>false,'errors'=>(string)$form['password']->getError()->getCode());
            }               
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


