<?php


require_once __DIR__."/../locales/Forms/EmployerUserViewForm.class.php";

class employers_ajaxViewEmployerAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();  
        $this->item=new EmployerUser(array('id'=>$request->getPostParameter('EmployerUser')));      
        $this->user=$this->getUser();       
        $this->form= new EmployerUserViewForm(array(),$this->getUser());                     
    }
}
