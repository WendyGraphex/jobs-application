<?php

require_once __DIR__."/../locales/Forms/EmployeeAddCategoriesForNewAdvertForm.class.php";
    
 
class employees_ajaxAddCategoriesForNewAdvertAction extends mfAction {
    

    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();
        $this->user=$this->getUser();              
        $this->form=new EmployeeAddCategoriesForNewAdvertForm($request->getPostParameter('AddCategoriesForAdvert'));
        $this->form->bind($request->getPostParameter('AddCategoriesForAdvert'));                     
    }

}


