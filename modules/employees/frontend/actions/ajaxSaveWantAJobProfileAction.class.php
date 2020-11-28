<?php

require_once __DIR__."/../locales/Forms/EmployeeWantAJobForm.class.php";
 

class employees_ajaxSaveWantAJobProfileAction extends mfAction {
    
    
    
    function execute(\mfWebRequest $request) {
        $messages = mfMessages::getInstance();                  
        try
        {
            $employee_user=$this->getUser()->getStorage()->read('want_a_job_employee_user',new Employee());                        
            $form=new EmployeeWantAJobForm($employee_user,$request->getPostParameter('EmployeeWantAJob'));
            $form->bind($request->getPostParameter('EmployeeWantAJob'));
            if ($form->isValid())
            {      
                
                $employee_user->add($form->getValues());                
                $employee_user->create();
                if ($this->getUser()->getStorage()->read('want_a_job_employee_user')==null)
                {    
                     $engine_email=new EmployeeEmailEngine($employee_user);
                     //$engine_email->sendValidation();                    
                    $this->getUser()->getStorage()->write('want_a_job_employee_user',$employee_user);
                }
                $this->forward($this->getModuleName(), 'ajaxWantAJobAdvert');                
            }    
            
           //   var_dump($form->getErrorSchema()->getErrorsMessage());
            $response=array('action'=>'WantAJobProfile','errors'=>$form->getErrorSchema()->getCodes());
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        } 
        $this->getController()->setRenderMode(mfView::RENDER_JSON);          
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
