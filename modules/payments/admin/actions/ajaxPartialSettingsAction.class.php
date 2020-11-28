<?php

require_once __DIR__."/../locales/Forms/PaymentSettingMultipleForm.class.php";

class payments_ajaxPartialSettingsAction extends mfAction {

     function execute(mfWebRequest $request) 
    {           
        $messages = mfMessages::getInstance();      
        $this->form=new PaymentSettingMultipleForm($request->getPostParameter('Settings'));                     
        $this->getEventDispather()->notify(new mfEvent($this->form,'payment.settings.form'));      
        if (!$request->isMethod('POST') || !$request->getPostParameter('Settings'))
           return ;
        try 
        {
            $this->form->bind($request->getPostParameter('Settings'));
            if ($this->form->isValid())
            {              
                $this->form->getSettings()->save();
                $this->getEventDispather()->notify(new mfEvent($this->form,'payment.settings.update'));           
                $messages->addInfo(__("Settings have been updated."));
            }
            else
            {
              $messages->addError(__("Form has some errors."));
             // $this->settings->add($request->getPostParameter('Settings')); // Repopulate
            //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }
        }
        catch (mfException $e)
        {
          $messages->addError($e);
        }     
    }    
}

