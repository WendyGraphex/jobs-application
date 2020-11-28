<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeExperienceViewForm.class.php";
 
class employees_ajaxViewExperienceI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new EmployeeExperienceViewForm();
        $this->item_i18n=new EmployeeExperienceI18n($request->getPostParameter('EmployeeExperienceI18n'));        
   }

}

