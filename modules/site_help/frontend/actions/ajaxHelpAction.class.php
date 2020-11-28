<?php


class site_help_ajaxHelpAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      $this->help_i18n=new SiteHelpI18n(array('name'=>$request->getRequestParameter('name'),'lang'=>$this->getUSer()->getLanguage()));       
    }
}

