<?php



class customers_academy_ajaxSelectCategoryAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();                     
        $this->item=new CustomerCourseCategory($request->getPostParameter('CustomerCourseCategoryNode'));         
    }
}

