<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademySoftwareForCategoryI18nViewForm.class.php";
 
class customers_academy_ajaxViewSoftwareI18nForCategoryI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new CustomerAcademySoftwareForCategoryI18nViewForm();
        $this->item_i18n=new CustomerAcademySoftwareI18n($request->getPostParameter('CustomerAcademySoftwareI18n'));        
   }

}

