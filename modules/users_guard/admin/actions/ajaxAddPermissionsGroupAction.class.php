<?php


class users_guard_ajaxAddPermissionsGroupAction  extends mfAction {
    
    
     function execute(mfWebRequest $request) {   
       $messages = mfMessages::getInstance();           
       $this->group=new Group($request->getPostParameter('group'),'admin');
      // $this->permissions=GroupPermissionUtils::getAllPermissions($this->group);
       $this->group_permissions=GroupPermissionUtils::getAllPermissionsGroupByPermissionGroup($this->group);       
    }

}