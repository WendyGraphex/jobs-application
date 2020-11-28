<?php


class payments_ajaxSettingspaymentsAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';    
    
    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();              
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);
        $this->forwardIf(!$site,"site","Admin");
      /*  $this->settings= new OrdersSettings(null,$site);   
        $this->form=new OrdersSettingsForm($site);  
        if ($request->getPostParameter('settings'))
        {
            try 
            {               
                $this->form->bind($request->getPostParameter('settings'));
                if ($this->form->isValid())
                {
                    $this->settings->add($this->form->getValues());
                    $this->settings->save();
                    $messages->addInfo(__("settings have been saved."));
                }
                else
                  $this->settings->add($request->getPostParameter('settings')); // Repopulate
            }
            catch (mfException $e)
            {
              $messages->addError($e);
            }
       }*/
    }
}

