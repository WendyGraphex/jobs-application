<?php

require_once __DIR__."/../locales/Forms/EmployerAddCategoriesForNewAdvertForm.class.php";
    
 
class employers_ajaxAddCategoriesForNewAdvertAction extends mfAction {
    

    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();
        $this->user=$this->getUser();              
        $this->form=new EmployerAddCategoriesForNewAdvertForm($request->getPostParameter('AddCategoriesForAdvert'));
        $this->form->bind($request->getPostParameter('AddCategoriesForAdvert'));                     
    }

}


