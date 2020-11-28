<?php

require_once __DIR__."/../locales/Forms/PermissionViewForm.class.php";

class users_guard_ajaxViewPermissionI18nAction extends mfAction {
    
     
       
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();                          
        $this->form = new PermissionViewForm();
        $this->item_i18n=new PermissionI18n($request->getPostParameter('PermissionI18n')) ;
    }

}
