<?php


require_once __DIR__."/../locales/Forms/EmployerAdvertPopularViewForm.class.php";

class employers_ajaxViewPopularAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();  
        $this->item=new EmployerAdvertPopular($request->getPostParameter('EmployerAdvertPopular'));      
        $this->user=$this->getUser();       
        $this->form= new EmployerAdvertPopularViewForm();             
            
             
    }
}
