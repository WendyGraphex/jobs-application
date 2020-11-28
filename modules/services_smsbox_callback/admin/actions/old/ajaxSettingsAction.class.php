<?php

require_once dirname(__FILE__)."/../locales/Forms/SmsBoxSettingsAdminForm.class.php";

class services_smsbox_ajaxSettingsAction extends mfAction {

    const SITE_NAMESPACE = 'system/site';
    
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();                     
          
        $this->settings= new SmsBoxSettings();   
        $this->form=new SmsBoxSettingsAdminForm();        
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
                    $this->forward('services_smsbox','ajaxListPartial');
                }
                else
                {          
                    var_dump($this->form->getErrorSchema()->getErrorsMessage());
                    $messages->addError(__('Settings has some errors.'));
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

