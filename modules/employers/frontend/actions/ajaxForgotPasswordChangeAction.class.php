<?php

require_once __DIR__."/../locales/Forms/EmployerUserForgotPasswordChangeForm.class.php";

class employers_ajaxForgotPasswordChangeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();
        try 
        {                    
             $form=new EmployerUserForgotPasswordChangeForm(); 
             $form->bind($request->getPostParameter('EmployerUserForgotPasswordChange'));
             if ($form->isValid())
             {                 
                 $this->user=$form->getEmployerUser()->save();                 
               //  $form->getForgotPassword()->delete();  // comments for debug
                 
                 $engine_email=new EmployerUserEmailEngine($this->user,$this);
                 $engine_email->sendForgotPasswordChange();
                 
                 $this->getUser()->signIn($this->user); // Connect user
                 return ;
             }
            $this->getController()->setRenderMode(mfView::RENDER_JSON);
            $response['errors']=$form->getErrorSchema()->getCodes();
            $response['error']=true;
            return $response;              
        }         
        catch (mfException $e) {
            $messages->addError($e);            
        }        
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
 
   
}


