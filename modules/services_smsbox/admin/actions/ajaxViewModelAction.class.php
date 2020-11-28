<?php

require_once __DIR__ . "/../locales/Forms/SmsBoxModelViewForm.class.php";

class services_smsbox_ajaxViewModelAction extends mfAction {

    function execute(mfWebRequest $request) {                  
        $messages = mfMessages::getInstance();        
        $this->item = new SmsBoxModel($request->getPostParameter('SmsBoxModel'));
        $this->form = new SmsBoxModelViewForm();
    }
}
