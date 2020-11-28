<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerNotationCategoryViewForm.class.php";
 
class employers_notation_ajaxViewCategoryI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployerNotationCategoryViewForm();
        $this->item_i18n=new EmployerNotationCategoryI18n($request->getPostParameter('EmployerNotationCategoryI18n'));        
   }

}

