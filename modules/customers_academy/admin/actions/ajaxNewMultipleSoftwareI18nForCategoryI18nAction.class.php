<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademySoftwareI18nForCategoryI18nMultipleNewForm.class.php";

class customers_academy_ajaxNewMultipleSoftwareI18nForCategoryI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $this->category_i18n=new CustomerCourseCategoryI18n($request->getPostParameter('CustomerCourseCategoryI18n')); 
        if ($this->category_i18n->getCategory()->isNotLoaded())
            return ;       
        $this->form= new CustomerAcademySoftwareI18nForCategoryI18nMultipleNewForm($this->category_i18n);       
    }

}

