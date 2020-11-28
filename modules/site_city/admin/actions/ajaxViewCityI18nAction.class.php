<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteCityViewForm.class.php";
 
class site_city_ajaxViewCityI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new SiteCityViewForm();
        $this->item_i18n=new SiteCityI18n($request->getPostParameter('SiteCityI18n'));        
   }

}

