<?php

require_once __DIR__."/../locales/Forms/Menu/CmsMenuPageI18nForm.class.php";

class cms_pages_ajaxSelectPageI18nAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();                     
        $this->item_i18n=new CmsPageI18n($request->getPostParameter('CmsPageI18n'));    
        $this->form = new CmsMenuPageI18nForm();
    }
}

