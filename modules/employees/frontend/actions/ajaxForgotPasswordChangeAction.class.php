<?php

require_once __DIR__."/../locales/Forms/EmployeeForgotPasswordChangeForm.class.php";

class employees_ajaxForgotPasswordChangeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();
        try 
        {                    
             $form=new EmployeeForgotPasswordChangeForm(); 
             $form->bind($request->getPostParameter('EmployeeForgotPasswordChange'));
             if ($form->isValid())
             {                 
                 $this->user=$form->getEmployee()->save();                 
               //  $form->getForgotPassword()->delete();  // comments for debug
                 
                $engine_email=new EmployeeEmailEngine($this->user,$this);
                $engine_email->sendForgotPasswordChange();
                 
                 $this->getUser()->signIn($this->user,$request->getIp()); // Connect user
               //  $this->redirect(link_i18n('employees_account'));
               //  die(__METHOD__);
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


