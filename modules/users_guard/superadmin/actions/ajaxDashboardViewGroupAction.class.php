<?php

require_once __DIR__."/../locales/Forms/GroupForm.class.php";

class users_guard_ajaxDashboardViewGroupAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();
        $this->form = new GroupForm();
        $this->group=new Group($request->getPostParameter('id'));
    }

}
