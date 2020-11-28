<?php

require_once __DIR__."/../locales/Forms/PermissionsGroupViewForm.class.php";
 
class users_guard_ajaxViewPermissionGroupI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();
        $this->form = new PermissionsGroupViewForm();
        $this->item=new PermissionGroupI18n($request->getPostParameter('PermissionGroupI18n'));        
   }

}

