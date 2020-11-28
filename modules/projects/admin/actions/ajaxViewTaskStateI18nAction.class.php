<?php

require_once dirname(__FILE__)."/../locales/Forms/ProjectTaskStateViewForm.class.php";
 
class projects_ajaxViewTaskStateI18nAction extends mfAction {
    
  
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new ProjectTaskStateViewForm();
        $this->item_i18n=new ProjectTaskStateI18n($request->getPostParameter('ProjectTaskStateI18n'));        
   }

}

