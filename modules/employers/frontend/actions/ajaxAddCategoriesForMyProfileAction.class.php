<?php

require_once __DIR__."/../locales/Forms/EmployerAddCategoriesForMyProfileForm.class.php";
    
 
class employers_ajaxAddCategoriesForMyProfileAction extends mfAction {
    

    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();
        $this->user=$this->getUser();              
        $this->form=new EmployerAddCategoriesForMyProfileForm($request->getPostParameter('AddCategoriesForMyProfile'));
        $this->form->bind($request->getPostParameter('AddCategoriesForMyProfile'));                     
    }

}


