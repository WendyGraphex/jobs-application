<?php


class emailer_spooler_ajaxSettingsAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';    
    
    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();                     
        $this->settings= new EmailerSpoolerSettings();        
        $this->form=new EmailerSpoolerSettingsForm();  
        if ($request->isMethod('POST') && $request->getPostParameter('Settings'))
        {
            try 
            {               
                $this->form->bind($request->getPostParameter('Settings'));
                if ($this->form->isValid())
                {
                    $this->settings->add($this->form->getValues());
                    $this->settings->save();
                    $messages->addInfo(__("Settings have been saved."));
                }
                else
                {
                   // var_dump($this->form->getErrorSchema()->getErrorsMessage());
                  $messages->addError(__('Form has somme errors.'));
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

