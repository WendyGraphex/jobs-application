<?php

require_once __DIR__."/../locales/Forms/SiteEventUserForgotPasswordChangeForm.class.php";

class employers_ajaxForgotPasswordChangeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();
        try 
        {                    
             $form=new SiteEventUserForgotPasswordChangeForm(); 
             $form->bind($request->getPostParameter('SiteEventUserForgotPasswordChange'));
             if ($form->isValid())
             {                 
                 $this->user=$form->getUser()->save();                 
                 $form->getForgotPassword()->delete();  // comments for debug
                 
                 $engine_email=new SiteEventUserEmailEngine($this->user,$this);
                 $engine_email->sendForgotPasswordChange();
                 
                 $this->getUser()->signIn($this->user); // Connect user
              //   $this->redirect(link_i18n('site_event_user_account'));
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


