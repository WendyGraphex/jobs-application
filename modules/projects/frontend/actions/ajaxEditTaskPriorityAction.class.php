<?php

require_once dirname(__FILE__)."/../locales/Forms/ProjectTaskPriorityEditForm.class.php";

class projects_ajaxEditTaskPriorityAction extends mfAction {
    
        
    
        
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();     
        $this->item=new ProjectTask($request->getPostParameter('ProjectTask'),$this->getUser()->getGuardUser());       
        $this->form= new ProjectTaskPriorityEditForm();         
    }

}
