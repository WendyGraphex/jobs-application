<?php

// www.project55.net/module/employer/notation/admin/SaveEmployeeNotation
require_once __DIR__."/../locales/Forms/AddEmployeeNotationByEmployerForm.class.php";

class employees_notation_ajaxSaveEmployeeNotationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployerUser()) 
           $this->forwardTo401Action();
       $response=array('action'=>'AddEmployeeNotationByEmployer');
       $form = new AddEmployeeNotationByEmployerForm($this->getUser()->getGuardUser());       
       $form->bind($request->getPostParameter('EmployeeReviewNotations'));
       if ($form->isValid())
       {          
           $form->getEmployeeAdvertI18nEmployeeCriteriaNotations()->create();
           $this->getEventDispather()->notify(new mfEvent($form, 'employee.advert_i18n.employer.notation'));                       
           $response['status']='OK';
       }   
       else      
       {         
           $response['error']=$form->getErrorSchema()->getCodes();
       } 
       return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

