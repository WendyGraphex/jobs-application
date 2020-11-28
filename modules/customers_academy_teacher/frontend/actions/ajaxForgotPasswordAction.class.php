<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyTeacherUserForgotPasswordForm.class.php";

class customers_academy_teacher_ajaxForgotPasswordAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
         
        $messages = mfMessages::getInstance();
        $form=new CustomerAcademyTeacherUserForgotPasswordForm($request->getPostParameter('CustomerAcademyTeacherUserForgotPassword'));          
        if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerAcademyTeacherUserForgotPassword')) 
             return ;
        try 
        {
            $form->bind($request->getPostParameter('CustomerAcademyTeacherUserForgotPassword'));
            if ($form->isValid()) {                                 
                $forgot_password = new CustomerAcademyTeacherUserForgotPassword($form->getEmployerUser());
                $forgot_password->createKey();
               
                $engine_email=new CustomerAcademyTeacherUserEmailEngine($form->getUser(),$this);
                $engine_email->sendForgotPassword($forgot_password); 
                
                $request->addRequestParameter('user',$forgot_password->getUser());
                $this->forward("site_user", "forgotPasswordSent");
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


