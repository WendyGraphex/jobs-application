<?php

include_once dirname(__FILE__).'/../locales/Forms/SmsBoxCallbackSettingsForm.class.php';

class services_smsbox_callback_ajaxSettingsAction extends mfAction {
    
//    const SITE_NAMESPACE = 'system/site';
    
    function execute(mfWebRequest $request) {
        
        $messages = mfMessages::getInstance();                     
//        $this->site = $this->getUser()->getStorage()->read(self::SITE_NAMESPACE);       
        
        $this->settings = new SmsBoxCallbackSettings();   
        $this->form = new SmsBoxCallbackSettingsForm(); 
        
        if ($request->getPostParameter('Settings'))
        {
            try 
            {               
                $this->form->bind($request->getPostParameter('Settings'));
                if ($this->form->isValid())
                {                 
                    $this->settings->add($this->form->getValues());
                    $this->settings->save();
                    $messages->addInfo(__("Settings have been saved."));
                    $this->forward('services_smsbox_callback','ajaxListPartialCallback');
                }
                else
                {          
                    //    var_dump($this->form->getErrorSchema());
                    $messages->addError(__('Forms has some errors.'));
                    $this->settings->add($request->getPostParameter('Settings')); // Repopulate
                }  
            }
            catch (mfException $e)
            {
                $messages->addError($e);
            }
        }
    }
}

