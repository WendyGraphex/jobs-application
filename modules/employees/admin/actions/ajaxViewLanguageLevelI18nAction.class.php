<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeLanguageLevelViewForm.class.php";
 
class employees_ajaxViewLanguageLevelI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployeeLanguageLevelViewForm();
        $this->item_i18n=new EmployeeLanguageLevelI18n($request->getPostParameter('EmployeeLanguageLevelI18n'));        
   }

}

