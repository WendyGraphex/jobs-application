<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeSkillViewForm.class.php";
 
class employees_ajaxViewSkillI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployeeSkillViewForm();
        $this->item_i18n=new EmployeeSkillI18n($request->getPostParameter('EmployeeSkillI18n'));        
   }

}

