<?php

require_once __DIR__."/../locales/Forms/UserLoginMobileForm.class.php";

class tests_loginAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
       // echo __METHOD__;
         $messages = mfMessages::getInstance();
         $this->form=new UserLoginMobileForm();
    } 
}

