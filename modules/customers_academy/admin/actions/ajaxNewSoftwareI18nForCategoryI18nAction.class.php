<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademySoftwareForCategoryI18nNewForm.class.php";

class customers_academy_ajaxNewSoftwareI18nForCategoryI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();    
        $this->category_i18n=new CustomerCourseCategoryI18n($request->getPostParameter('CustomerCourseCategoryI18n')); 
        if ($this->category_i18n->getCategory()->isNotLoaded())
            return ;
        $this->form= new CustomerAcademySoftwareForCategoryI18nNewForm($this->category_i18n->get('lang'),array());
        $this->item_i18n=new CustomerAcademySoftwareI18n(array('lang'=>$this->category_i18n->get('lang')));        
    }

}
