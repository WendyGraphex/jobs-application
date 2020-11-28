<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerContractTypeViewForm.class.php";
 
class employers_ajaxViewTypeI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployerContractTypeViewForm();
        $this->item_i18n=new EmployerContractTypeI18n($request->getPostParameter('EmployerContractTypeI18n'));        
   }

}

