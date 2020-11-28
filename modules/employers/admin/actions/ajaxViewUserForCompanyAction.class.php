<?php

require_once __DIR__."/../locales/Forms/EmployerUserViewForm.class.php";

class employers_ajaxViewUserForCompanyAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();
        $this->item=new EmployerUser($request->getPostParameter('EmployerUser'));
        $this->form= new EmployerUserViewForm();                 
    }
}
