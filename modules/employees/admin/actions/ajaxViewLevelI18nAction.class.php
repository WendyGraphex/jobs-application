<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeStudyLevelViewForm.class.php";
 
class employees_ajaxViewLevelI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployeeStudyLevelViewForm();
        $this->item_i18n=new EmployeeStudyLevelI18n($request->getPostParameter('EmployeeStudyLevelI18n'));        
   }

}

