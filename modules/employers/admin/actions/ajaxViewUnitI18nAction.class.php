<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerBudgetUnitViewForm.class.php";
 
class employers_ajaxViewUnitI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployerBudgetUnitViewForm();
        $this->item_i18n=new EmployerBudgetUnitI18n($request->getPostParameter('EmployerBudgetUnitI18n'));        
   }

}

