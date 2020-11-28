<?php

require_once __DIR__."/../locales/Forms/UserForm.class.php";

class users_ajaxViewUserAction extends mfAction {

    function execute(mfWebRequest $request) {                        
        $messages = mfMessages::getInstance();              
        $this->user=$this->getUser();
        $this->item=new User($request->getPostParameter('User'),'admin');  
        $this->form = new UserForm($this->getUser()->getCountry());         
    }

}
