<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteShopViewForm.class.php";
 
class site_shop_ajaxViewShopI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new SiteShopViewForm();
        $this->item_i18n=new SiteShopI18n($request->getPostParameter('SiteShopI18n')); 
        $this->item=new SiteShop(array('lang'=>$this->getUser()->getLanguage())); 
        
   }

}

