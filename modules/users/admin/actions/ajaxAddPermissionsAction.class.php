<?php


class users_ajaxAddPermissionsAction  extends mfAction {
    
     
     function execute(mfWebRequest $request) 
     {   
        $messages = mfMessages::getInstance();                    
        $this->user=new User($request->getPostParameter('User'),'admin');
        $this->permissions=userPermissionUtils::getAllPermissions($this->user);    
    }

}