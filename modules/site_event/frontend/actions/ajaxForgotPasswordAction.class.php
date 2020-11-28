<?php

require_once __DIR__."/../locales/Forms/SiteEventUserForgotPasswordForm.class.php";

class site_event_ajaxForgotPasswordAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
         
        $messages = mfMessages::getInstance();
        $form=new SiteEventUserForgotPasswordForm($request->getPostParameter('SiteEventUserForgotPassword'));          
        if (!$request->isMethod('POST') || !$request->getPostParameter('SiteEventUserForgotPassword')) 
             return ;
        try 
        {
            $form->bind($request->getPostParameter('SiteEventUserForgotPassword'));
            if ($form->isValid()) {   
                
                 
                $forgot_password = new SiteEventUserForgotPassword($form->getUser());
                $forgot_password->createKey();
                
                $engine_email=new SiteEventUserEmailEngine($form->getUser(),$this);
                $engine_email->sendForgotPassword($forgot_password); 
                
                 return ;
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


