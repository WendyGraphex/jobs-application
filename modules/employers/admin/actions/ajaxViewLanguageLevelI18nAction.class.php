<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerLanguageLevelViewForm.class.php";
 
class employers_ajaxViewLanguageLevelI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployerLanguageLevelViewForm();
        $this->item_i18n=new EmployerLanguageLevelI18n($request->getPostParameter('EmployerLanguageLevelI18n'));        
   }

}

