<?php

require_once __DIR__."/../locales/Forms/SystemModelEmailViewForm.class.php";
 
class system_emails_ajaxViewModelI18nAction extends mfAction {

    function execute(mfWebRequest $request) {                   
        $messages = mfMessages::getInstance();
        $this->form = new SystemModelEmailViewForm();
        $this->item=new SystemModelEmailI18n($request->getPostParameter('SystemModelEmailI18n'));    
        $this->country=$this->getUser()->getCountry();
   }

}

