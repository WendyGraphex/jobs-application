<?php



 class SiteShopI18nForm extends SiteShopI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('shop_id', new mfValidatorInteger());
    }
    
 
}


