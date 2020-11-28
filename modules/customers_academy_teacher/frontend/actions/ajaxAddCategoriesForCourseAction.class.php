<?php

require_once __DIR__."/../locales/Forms/CustomerCourseCategoryAddForm.class.php";
    
 
class customers_academy_teacher_ajaxAddCategoriesForCourseAction extends mfAction {
    

    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();
        $this->user=$this->getUser();              
        $this->form=new CustomerCourseCategoryAddForm($request->getPostParameter('CustomerCourseCategories'));
        $this->form->bind($request->getPostParameter('CustomerCourseCategories'));                     
    }

}


