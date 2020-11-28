<?php

require_once __DIR__."/../locales/Forms/SiteEventPlaceViewForm.class.php";
 
class site_event_ajaxViewPlaceAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();
        $this->form = new SiteEventPlaceViewForm();
        $this->item=new SiteEventPlace($request->getPostParameter('SiteEventPlace'));          
   }

}

