<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyTopicI18nForCategoryI18nMultipleNewForm.class.php";

class customers_academy_ajaxNewMultipleTopicI18nForCategoryI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $this->category_i18n=new CustomerCourseCategoryI18n($request->getPostParameter('CustomerCourseCategoryI18n')); 
        if ($this->category_i18n->getCategory()->isNotLoaded())
            return ;       
        $this->form= new CustomerAcademyTopicI18nForCategoryI18nMultipleNewForm($this->category_i18n);       
    }

}

