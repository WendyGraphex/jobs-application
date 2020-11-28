<?php

// www.project55.net/module/employer/notation/admin/SaveEmployeeNotation
require_once __DIR__."/../locales/Forms/AddEmployeeNotationByEmployerForm.class.php";

class employers_notation_ajaxSaveEmployeeNotationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployerUser()) 
           $this->forwardTo401Action();
       $response=array('action'=>'AddEmployeeNotationByEmployer');
       $form = new AddEmployeeNotationByEmployerForm($this->getUser()->getGuardUser());       
       $form->bind($request->getPostParameter('EmployeeReviewNotations'));
       if ($form->isValid())
       {          
           $form->getEmployerAdvertI18nEmployerCriteriaNotations()->create();                  
           $this->getEventDispather()->notify(new mfEvent($form, 'employer.advert_i18n.employee.notation'));                       
           $response['status']='OK';
       }   
       else
       {         
           $response['error']=$form->getErrorSchema()->getCodes();
       } 
       return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

