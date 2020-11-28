<?php

require_once __DIR__."/../locales/Forms/GroupViewForm.class.php";

class users_guard_ajaxViewGroupI18nAction extends mfAction {

    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                            
        $this->form= new GroupViewForm();
        $this->item_i18n=new GroupI18n($request->getPostParameter('GroupI18n'));        
    }

}
