<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerFunctionViewForm.class.php";
 
class employers_ajaxViewFunctionI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployerFunctionViewForm();
        $this->item_i18n=new EmployerFunctionI18n($request->getPostParameter('EmployerFunctionI18n'));        
   }

}

