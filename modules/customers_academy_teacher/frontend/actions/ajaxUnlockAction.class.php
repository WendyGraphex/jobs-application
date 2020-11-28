<?php
 
require_once __DIR__."/../locales/Forms/CustomerAcademyTeacherUserUnlockForm.class.php";

class customers_academy_teacher_ajaxUnlockAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();   
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isTeacherUser()) 
                $this->forwardTo401Action();
        try 
        {                      
            $form = new CustomerAcademyTeacherUserUnlockForm($this->getUser()->getGuardUser());
            $form->bind($request->getPostParameter('CustomerAcademyTeacherUserUnlock'));
            if ($form->isValid())
            {               
                $this->getUser()->getGuardUser()->unlock(); 
                $response=array("unlock"=>true,'action'=>'Unlock');
            }  
            else
            {
               // var_dump($form->getErrorSchema()->getErrorsMessage());
                $response=array('action'=>'Unlock','unlock'=>false,'errors'=>(string)$form['password']->getError()->getCode());
            }               
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


