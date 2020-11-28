<?php

require_once __DIR__."/../locales/Forms/SiteCompanyForm.class.php";

class site_company_ajaxViewAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';
       
    function execute(mfWebRequest $request) 
    {             
        $messages = mfMessages::getInstance();
        $this->site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);               
        $this->forwardIf(!$this->site,"sites","Admin");       
        $this->site_company=SiteCompanyUtils::getSiteCompany($this->site);      
        $this->form=new SiteCompanyForm(array('country'=>'FR'));
        
    }

}


