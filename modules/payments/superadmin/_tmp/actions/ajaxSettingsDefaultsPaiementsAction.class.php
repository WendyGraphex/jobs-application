<?php


class payments_ajaxSettingsDefaultspaymentsAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';    
    
    function execute(mfWebRequest $request)
    {    
        $messages = mfMessages::getInstance();     
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);
        $this->forwardIf(!$site,"site","Admin");
     //   $this->settings=OrdersSettings::load($site);   
      //  $this->settings->delete();  
      //  $this->form=new OrdersSettingsForm($site);  
    }
}

