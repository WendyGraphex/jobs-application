<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeNotationCriteriaViewForm.class.php";
 
class employees_notation_ajaxViewCriteriaI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployeeNotationCriteriaViewForm();
        $this->item_i18n=new EmployeeNotationCriteriaI18n($request->getPostParameter('EmployeeNotationCriteriaI18n'));        
   }

}

