<?php


require_once __DIR__."/../locales/Forms/CustomerCourseCategoryViewForm.class.php";

class customers_academy_ajaxViewCategoryI18nAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();             
        $this->user=$this->getUser();       
        $this->form = new CustomerCourseCategoryViewForm();
        $this->item_i18n=new CustomerCourseCategoryI18n($request->getPostParameter('CustomerCourseCategoryI18n'));         
    }
}
