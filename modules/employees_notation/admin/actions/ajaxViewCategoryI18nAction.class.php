<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeNotationCategoryViewForm.class.php";
 
class employees_notation_ajaxViewCategoryI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployeeNotationCategoryViewForm();
        $this->item_i18n=new EmployeeNotationCategoryI18n($request->getPostParameter('EmployeeNotationCategoryI18n'));        
   }

}

