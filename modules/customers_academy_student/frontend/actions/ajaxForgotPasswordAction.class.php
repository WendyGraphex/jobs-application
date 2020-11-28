<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyStudentUserForgotPasswordForm.class.php";

class customers_academy_student_ajaxForgotPasswordAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
         
        $messages = mfMessages::getInstance();
        $form=new CustomerAcademyStudentUserForgotPasswordForm($request->getPostParameter('CustomerAcademyStudentUserForgotPassword'));          
        if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerAcademyStudentUserForgotPassword')) 
             return ;
        try 
        {
            $form->bind($request->getPostParameter('CustomerAcademyStudentUserForgotPassword'));
            if ($form->isValid()) {                                 
                $forgot_password = new CustomerAcademyStudentUserForgotPassword($form->getUser());
                $forgot_password->createKey();
               
                $engine_email=new CustomerAcademyStudentUserEmailEngine($form->getUser(),$this);
                $engine_email->sendForgotPassword($forgot_password); 
                
                $request->addRequestParameter('user',$forgot_password->getUser());
                $this->forward("customers_academy_student", "forgotPasswordSent");
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


