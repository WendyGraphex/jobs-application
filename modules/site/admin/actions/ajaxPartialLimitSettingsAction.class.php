<?php

require_once __DIR__."/../locales/Forms/SiteLimitSettingForm.class.php";

class site_ajaxPartialLimitSettingsAction extends mfAction {

     function execute(mfWebRequest $request) 
    {           
        $messages = mfMessages::getInstance();
        $this->settings= new SiteSettings();
        $this->form=new SiteLimitSettingForm($this->settings,$request->getPostParameter('Settings'));                     
        $this->getEventDispather()->notify(new mfEvent($this->form,'site.limit.settings.form'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('Settings'))
           return ;
        try 
        {
            $this->form->bind($request->getPostParameter('Settings'));
            if ($this->form->isValid())
            {
                //var_dump($this->form->getValues());
                $this->settings->add($this->form->getValues());
                $this->settings->save();
             //   echo $this->settings->get('admin_recipients');
                $messages->addInfo(__("Settings have been updated."));
            }
            else
            {
              $messages->addError(__("Form has some errors."));
              $this->settings->add($request->getPostParameter('Settings')); // Repopulate
            //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }
        }
        catch (mfException $e)
        {

          $messages->addError($e);
        }     
    }    
}

