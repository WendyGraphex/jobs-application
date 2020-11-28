<?php


class employers_forgotPasswordChangeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();
        try 
        {                    
           if (!$request->isMethod('GET')) 
                throw new mfException(__('This key is invalid.'));         
            $validator=new KeyForgotPasswordValidator();           
            $this->forgot= new EmployerUserForgotPassword(array('key'=>$validator->isValid($request->getGetParameter('k'))));                              
            if ($this->forgot->isNotLoaded())
                 throw new mfException(__('This key is invalid.'));  
            $this->settings = new employerSettings();
           // $this->model=$settings->getForgotPasswordSentTextModel();                         
        } 
        catch (mfValidatorError $e)
        {         
            $this->forward('employers','forgotPassword');
        }
        catch (mfException $e) {
            $messages->addError($e);
            $this->forward('employers','forgotPassword');
        }        
    }
    
 
   
}


