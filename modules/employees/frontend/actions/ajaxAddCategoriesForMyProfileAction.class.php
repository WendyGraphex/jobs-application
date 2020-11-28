<?php

require_once __DIR__."/../locales/Forms/EmployeeAddCategoriesForMyProfileForm.class.php";
    
 
class employees_ajaxAddCategoriesForMyProfileAction extends mfAction {
    

    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();
        $this->user=$this->getUser();              
        $this->form=new EmployeeAddCategoriesForMyProfileForm($request->getPostParameter('AddCategoriesForMyProfile'));
        $this->form->bind($request->getPostParameter('AddCategoriesForMyProfile'));                     
    }

}


