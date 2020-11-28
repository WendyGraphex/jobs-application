<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerActivityViewForm.class.php";
 
class employers_ajaxViewActivityI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployerActivityViewForm();
        $this->item_i18n=new EmployerActivityI18n($request->getPostParameter('EmployerActivityI18n'));        
   }

}

