<?php

require_once __DIR__."/../locales/Forms/EmployeeSearchQueryForm.class.php";


class employees_findEmployeePanelActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
             $this->form= new  EmployeeSearchQueryForm();          
     
    } 
    
    
}
