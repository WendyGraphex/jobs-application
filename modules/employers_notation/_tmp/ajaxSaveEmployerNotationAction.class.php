<?php

// www.project55.net/module/employer/notation/admin/SaveEmployeeNotation
require_once __DIR__."/../locales/Forms/AddEmployerNotationByEmployeeForm.class.php";

class employers_notation_ajaxSaveEmployerNotationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployee()) 
           $this->forwardTo401Action();
       $response=array('action'=>'AddEmployerNotationByEmployer');
       $form = new AddEmployerNotationByEmployeeForm($this->getUser()->getGuardUser());          
       $form->bind($request->getPostParameter('EmployerReviewNotations'));
       if ($form->isValid())
       {          
           $form->getEmployerAdvertI18nEmployerCriteriaNotations()->create();
           $this->getEventDispather()->notify(new mfEvent($form, 'employer.advert_i18n.employer.notation'));                       
           $response['status']='OK';
       }   
       else
       {         
           $response['error']=$form->getErrorSchema()->getCodes();
       } 
       return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

