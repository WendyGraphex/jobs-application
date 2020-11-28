<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteWarningViewForm.class.php";
 
class site_warning_ajaxViewWarningI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new SiteWarningViewForm();
        $this->item_i18n=new SiteWarningI18n($request->getPostParameter('SiteWarningI18n'));        
   }

}

