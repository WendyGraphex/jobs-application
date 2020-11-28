<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeFunctionViewForm.class.php";
 
class employees_ajaxViewFunctionI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployeeFunctionViewForm();
        $this->item_i18n=new EmployeeFunctionI18n($request->getPostParameter('EmployeeFunctionI18n'));        
   }

}

