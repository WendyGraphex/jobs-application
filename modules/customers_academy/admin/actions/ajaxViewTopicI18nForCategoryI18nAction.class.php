<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyTopicForCategoryI18nViewForm.class.php";
 
class customers_academy_ajaxViewTopicI18nForCategoryI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new CustomerAcademyTopicForCategoryI18nViewForm();
        $this->item_i18n=new CustomerAcademyTopicI18n($request->getPostParameter('CustomerAcademyTopicI18n'));        
   }

}

