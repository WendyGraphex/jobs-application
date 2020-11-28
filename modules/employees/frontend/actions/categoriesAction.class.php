<?php

// www.project55.net/employee/categories
//require_once __DIR__."/../locales/Forms/EmployeePartnerWorkCategoryForm.class.php";

class employees_categoriesAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();               
        $this->node=new EmployeeWorkCategory('root');             
    }
}
