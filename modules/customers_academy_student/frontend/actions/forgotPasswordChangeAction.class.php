<?php


class customers_academy_student_forgotPasswordChangeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();
        try 
        {                    
           if (!$request->isMethod('GET')) 
                throw new mfException(__('This key is invalid.'));         
            $validator=new KeyForgotPasswordValidator();           
            $this->forgot= new CustomerAcademyStudentUserForgotPassword(array('key'=>$validator->isValid($request->getGetParameter('k'))));                              
            if ($this->forgot->isNotLoaded())
                 throw new mfException(__('This key is invalid.'));  
            $this->settings = new SiteEventSettings();
           // $this->model=$settings->getForgotPasswordSentTextModel();                         
        } 
        catch (mfValidatorError $e)
        {         
            $this->forward('customers_academy_student','forgotPassword');
        }
        catch (mfException $e) {
            $messages->addError($e);
            $this->forward('customers_academy_student','forgotPassword');
        }        
    }
    
 
   
}


