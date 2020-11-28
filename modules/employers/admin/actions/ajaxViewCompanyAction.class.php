<?php


require_once __DIR__."/../locales/Forms/EmployerCompanyViewForm.class.php";

class employers_ajaxViewCompanyAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();  
        $this->item=new EmployerCompany($request->getPostParameter('EmployerCompany'));      
        $this->user=$this->getUser();       
        $this->form= new EmployerCompanyViewForm();             
            
             
    }
}
