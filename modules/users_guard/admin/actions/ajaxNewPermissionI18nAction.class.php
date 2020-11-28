<?php

require_once __DIR__."/../locales/Forms/PermissionsI18nNewForm.class.php";

class users_guard_ajaxNewPermissionI18nAction extends mfAction {
  
     
     
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();
        $form=new LanguageAdminForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('Lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getCountry());
            $this->forward('users_guard','ajaxListPartialPermission');  
        }                        
        $this->form = new PermissionsI18nNewForm((string)$form['lang']);            
    }

}
