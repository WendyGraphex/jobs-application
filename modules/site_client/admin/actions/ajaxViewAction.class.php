<?php

require_once __DIR__."/../locales/Forms/SiteClientForm.class.php";

class site_client_ajaxViewAction extends mfAction
{

    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();
        $this->form=new SiteClientForm($request->getPostParameter('SiteClient'));
        $this->item=new SiteClient($request->getPostParameter('SiteClient'),'frontend');              
    }

}

