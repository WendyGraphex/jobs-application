<?php

require __DIR__."/../locales/Forms/SystemEmailerEmailForm.class.php";

class system_emailer_ajaxEmailerAction extends mfAction {
    
   
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();       
        $domain=new mfUrl(mfConfig::getSuperAdmin('host'));
        $this->form=new SystemEmailerEmailForm();
        $this->form->setDefault('from','contact@'.$domain->getDomainTLS());
        $this->transport=$this->getMailer()->getTransport();      
    }
}

