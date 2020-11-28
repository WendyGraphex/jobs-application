<?php

require_once __DIR__."/../locales/Forms/EmployeeForgotPasswordForm.class.php";

class employees_ajaxForgotPasswordAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();
        $form=new EmployeeForgotPasswordForm($request->getPostParameter('EmployeeForgotPassword'));          
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeForgotPassword')) 
             return ;
        try 
        {
            $form->bind($request->getPostParameter('EmployeeForgotPassword'));
            if ($form->isValid()) {                                 
                $forgot_password = new EmployeeForgotPassword($form->getEmployee());
                $forgot_password->createKey();
               
                $engine_email=new EmployeeEmailEngine($form->getEmployee(),$this);
                $engine_email->sendForgotPassword($forgot_password); 
                
                $request->addRequestParameter('employee',$forgot_password->getEmployee());
                $this->forward("employees", "forgotPasswordSent");
            }      
            else
            {                        
                 $response = array("action"=>"ForgotPassword",
                                   'errors'=>$form->getErrorSchema()->getErrorsMessage(),
                                    );                            
            }    
        } catch (mfException $e) {
            $messages->addError($e);
        }       
        $this->getController()->setRenderMode(mfView::RENDER_JSON);
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
 
   
}


