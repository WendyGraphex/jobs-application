<?php

require_once __DIR__."/../locales/Forms/UserSuperAdminNewForm.class.php";


class users_ajaxDashboardNewUserAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();
        try {          
            $this->form=new UserSuperAdminNewForm();                            
            $this->user=new User();                
        }         
        catch (mfException $e)
        {
           $messages->addError($e);
        }             
    }

}
