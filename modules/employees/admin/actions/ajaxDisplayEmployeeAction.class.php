<?php

require_once __DIR__."/../locales/Forms/EmployeeViewForm.class.php";

class employees_ajaxDisplayEmployeeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();  
        $this->item=new Employee(array('id'=>$request->getPostParameter('Employee')));      
        $this->user=$this->getUser();    
        $this->form= new EmployeeViewForm(array(),$this->getUser());
    }
}
