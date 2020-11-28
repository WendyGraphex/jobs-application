<?php

require_once __DIR__."/../locales/Forms/PermissionForm.class.php";

class users_guard_ajaxDashboardViewPermissionAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();
        $this->form = new PermissionForm();
        $this->permission=new Permission($request->getPostParameter('id'));
    }

}
