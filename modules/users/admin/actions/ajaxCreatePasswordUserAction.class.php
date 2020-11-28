<?php

require_once __DIR__."/../locales/Forms/CreatePasswordUserForm.class.php";


class users_ajaxCreatePasswordUserAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {             
        $messages = mfMessages::getInstance();       
        $this->user = new User($request->getPostParameter('User'),'admin'); // new object
        $this->form = new CreatePasswordUserForm(array(),$this->site);               
    }

}
