<?php

require_once __DIR__."/../locales/Forms/GroupNewForm.class.php";

class users_guard_ajaxNewGroupI18nAction extends mfAction {
  
     
     
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();
        $form=new LanguageAdminForm($this->getUser()->getCountry());
        $form->bind($request->getPostParameter('Lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getCountry());
            $this->forward('users_guard','ajaxListPartialGroup');  
        }                        
        $this->form = new GroupNewForm((string)$form['lang']);    
        $this->item_i18n=new GroupI18n(array('lang'=>(string)$form['lang']));   
    }

}
