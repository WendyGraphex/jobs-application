<?php

require_once dirname(__FILE__)."/../locales/Forms/Page/CmsPageI18nViewForm.class.php";

class cms_pages_ajaxViewPageI18nAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();                       
        $this->form= new CmsPageI18nViewForm();
        $this->page_i18n=new CmsPageI18n($request->getPostParameter('CmsPageI18n'));  
    }
    
      
}

