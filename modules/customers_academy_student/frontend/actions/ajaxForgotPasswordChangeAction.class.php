<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyStudentUserForgotPasswordChangeForm.class.php";

class employers_ajaxForgotPasswordChangeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();
        try 
        {                    
             $form=new CustomerAcademyStudentUserForgotPasswordChangeForm(); 
             $form->bind($request->getPostParameter('CustomerAcademyStudentUserForgotPasswordChange'));
             if ($form->isValid())
             {                 
                 $this->user=$form->getUser()->save();                 
                 $form->getForgotPassword()->delete();  // comments for debug
                 
                 $engine_email=new CustomerAcademyStudentUserEmailEngine($this->user,$this);
                 $engine_email->sendForgotPasswordChange();
                 
                 $this->getUser()->signIn($this->user); // Connect user
                 $this->redirect(link_i18n('suppliers_account'));
               //  die(__METHOD__);
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


