<?php

require_once __DIR__."/../locales/Forms/SiteCompanyForm.class.php";

class site_company_ajaxMyCompanyAction extends mfAction {

    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                            
        $this->site_company=SiteCompany::getSiteCompany();      
        $this->form=new SiteCompanyForm();     
    }

}
