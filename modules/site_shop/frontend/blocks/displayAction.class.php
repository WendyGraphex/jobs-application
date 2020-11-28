<?php


class site_shop_displayActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {
         $this->shop_i18n=new SiteShopI18n(array('lang'=>$this->getUser()->getLanguage()));
         if ($this->shop_i18n->isNotLoaded())
             $this->shop_i18n=new SiteShopI18n(array('lang'=>'en'));
         $this->tpl=$this->getParameter('tpl');               
         $this->field=$this->getParameter('field');  
    } 
    
    
}

