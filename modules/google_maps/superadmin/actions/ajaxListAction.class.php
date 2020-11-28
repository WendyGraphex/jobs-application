<?php

class google_maps_ajaxListAction extends mfAction {

    
    function execute(mfWebRequest $request) {
         $messages = mfMessages::getInstance();                     
         $this->accounts=new mfArray();
         
         foreach (SiteUtils::getSites() as $site)
         {
             $this->accounts[$site->get('id')]=new  GoogleMapsSettings(null,$site);   
         }
    }

}

