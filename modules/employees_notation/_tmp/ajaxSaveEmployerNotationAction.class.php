<?php

// www.project55.net/module/employer/notation/admin/SaveEmployeeNotation
require_once __DIR__."/../locales/Forms/AddEmployerNotationByEmployeeForm.class.php";

class employees_notation_ajaxSaveEmployerNotationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployee()) 
           $this->forwardTo401Action();
        $response=array('action'=>'AddEmployeeNotationByEmployer');      
       $form = new AddEmployerNotationByEmployeeForm($this->getUser()->getGuardUser());       
       $form->bind($request->getPostParameter('EmployerReviewNotations'));
       if ($form->isValid())
       {          
           $form->getEmployeeAdvertI18nNotations()->create();
           $this->getEventDispather()->notify(new mfEvent($form, 'employee.advert_i18n.employer.notation'));    
           
           $engine= new EmployeeUserNotationEmailEngine($form->getEmployeeAdvertI18nNotations(),$this->getUser()->getGuardUser());
           $engine->sendNotation();
           
           $response['status']='OK';
       }   
       else      
       {         
           $response['error']=$form->getErrorSchema()->getCodes();
       } 
       return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

