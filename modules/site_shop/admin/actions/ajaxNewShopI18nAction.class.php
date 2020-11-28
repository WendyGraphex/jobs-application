<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteShopNewForm.class.php";

class site_shop_ajaxNewShopI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
         $this->form= new SiteShopNewForm($this->getUser()->getLanguage(),array());
        $this->item_i18n=new SiteShopI18n(array('lang'=>$this->getUser()->getLanguage()));
        $this->item=new SiteShop(array('lang'=>$this->getUser()->getLanguage()));  
    }

}
