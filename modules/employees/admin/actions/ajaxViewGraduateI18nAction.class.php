<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeGraduateDiplomaViewForm.class.php";
 
class employees_ajaxViewGraduateI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployeeGraduateDiplomaViewForm();
        $this->item_i18n=new EmployeeGraduateDiplomaI18n($request->getPostParameter('EmployeeGraduateDiplomaI18n'));        
   }

}

