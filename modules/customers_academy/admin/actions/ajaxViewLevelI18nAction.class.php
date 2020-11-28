<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyLevelViewForm.class.php";
 
class customers_academy_ajaxViewLevelI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new CustomerAcademyLevelViewForm();
        $this->item_i18n=new CustomerAcademyLevelI18n($request->getPostParameter('CustomerAcademyLevelI18n'));        
   }

}

