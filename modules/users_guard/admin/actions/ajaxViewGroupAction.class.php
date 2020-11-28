<?php

require_once __DIR__."/../locales/Forms/GroupViewForm.class.php";


class users_guard_ajaxViewGroupAction extends mfAction {
    
    
       
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();
        $this->form = new GroupForm();                         
        $this->group=new Group($request->getPostParameter('id'),'admin') ;
    }

}
