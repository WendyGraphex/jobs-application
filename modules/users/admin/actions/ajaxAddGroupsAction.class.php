<?php


class users_ajaxAddGroupsAction  extends mfAction {
    
     
     function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();            
        $this->user=new User($request->getPostParameter('User'),'admin');
        $this->groups=userGroupUtils::getGroupsUserList($this->user);    
    }

}