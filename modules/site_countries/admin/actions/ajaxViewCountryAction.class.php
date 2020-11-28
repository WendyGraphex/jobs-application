<?php

require_once __DIR__."/../locales/Forms/SiteCountryViewForm.class.php";

class site_countries_ajaxViewCountryAction extends mfAction
{

    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();
        $this->form=new SiteCountryViewForm();
        $this->item=new SiteCountry($request->getPostParameter('SiteCountry'));        
    }

}

