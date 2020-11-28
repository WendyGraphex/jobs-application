<?php


class site_warning_ajaxWarningAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      $this->warning_i18n=new SiteWarningI18n(array('name'=>$request->getRequestParameter('name'),'lang'=>$this->getUSer()->getLanguage()));       
    }
}

