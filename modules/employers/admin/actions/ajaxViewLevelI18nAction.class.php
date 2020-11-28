<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerLevelViewForm.class.php";
 
class employers_ajaxViewLevelI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployerLevelViewForm();
        $this->item_i18n=new EmployerLevelI18n($request->getPostParameter('EmployerLevelI18n'));        
   }

}

