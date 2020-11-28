<?php

require_once __DIR__."/../locales/Forms/EmployerForgotPasswordForm.class.php";

class employers_ajaxForgotPasswordAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();
        $form=new EmployerForgotPasswordForm($request->getPostParameter('EmployerForgotPassword'));          
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerForgotPassword')) 
             return ;
        try 
        {
            $form->bind($request->getPostParameter('EmployerForgotPassword'));
            if ($form->isValid()) {                                 
                $forgot_password = new EmployerUserForgotPassword($form->getEmployerUser());
                $forgot_password->createKey();
               
                $engine_email=new EmployerUserEmailEngine($form->getEmployerUser(),$this);
                $engine_email->sendForgotPassword($forgot_password); 
                
                $request->addRequestParameter('employer_user',$forgot_password->getEmployerUser());
                $this->forward("employers", "forgotPasswordSent");
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


