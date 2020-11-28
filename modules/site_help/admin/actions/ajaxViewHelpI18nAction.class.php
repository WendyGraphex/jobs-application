<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteHelpViewForm.class.php";
 
class site_help_ajaxViewHelpI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new SiteHelpViewForm();
        $this->item_i18n=new SiteHelpI18n($request->getPostParameter('SiteHelpI18n'));        
   }

}

