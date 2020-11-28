<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerNotationCriteriaViewForm.class.php";
 
class employers_notation_ajaxViewCriteriaI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployerNotationCriteriaViewForm();
        $this->item_i18n=new EmployerNotationCriteriaI18n($request->getPostParameter('EmployerNotationCriteriaI18n'));        
   }

}

