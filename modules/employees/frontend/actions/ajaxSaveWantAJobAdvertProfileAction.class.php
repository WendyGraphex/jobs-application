<?php

require_once __DIR__."/../locales/Forms/EmployeeAdvertI18nMultipleNewForm.class.php";

class employees_ajaxSaveWantAJobAdvertProfileAction extends mfAction {
    
    
    
    function execute(\mfWebRequest $request) {
        $messages = mfMessages::getInstance();            
         $employee_user=$this->getUser()->getStorage()->read('want_a_job_employee_user');        
        if (!$employee_user && !$this->getUser()->isEmployee())
            $this->forwardTo401Action();
        if (!$employee_user)
           $employee_user = $this->getUser()->isEmployee();        
        try
        {                     
            $form = new EmployeeAdvertI18nMultipleNewForm($employee_user,$request->getPostParameter('EmployeeAdvertMultiple'));      
            $form->bind($request->getPostParameter('EmployeeAdvertMultiple'));
            if ($form->isValid())
            {                    
                $form->getAdvert()->create();           
             
                $engine = new EmployeeAdvertEmailEngine($form->getAdvert());
                $engine->sendCreated();

                $this->getEventDispather()->notify(new mfEvent($form->getAdvert(), 'employee.advert.create')); 
                              
                 $this->getUser()->getStorage()->remove('want_a_job_employee_user');   
            }       
            else
            {
                $this->getController()->setRenderMode(mfView::RENDER_JSON);
                $response=array('action'=>'SaveWantAJobAdvertProfile');
                $response['errors']=$form->getErrorSchema()->getCodes();               
                return $response;
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }              
    }
}
