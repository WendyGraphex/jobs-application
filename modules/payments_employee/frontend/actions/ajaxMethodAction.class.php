<?php

require_once __DIR__."/../locales/Forms/PaymentEmployeeSettingsMultipleForm.class.php";

class payments_employee_ajaxMethodAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action();        
        $messages = mfMessages::getInstance();               
        $this->form=new PaymentEmployeeSettingsMultipleForm($this->getUser()->getGuardUser(),$request->getPostParameter('PaymentEmployeeSettings'));
        $this->getEventDispather()->notify(new mfEvent($this->form,'payment.employee.settings.form'));            
        if (!$request->isMethod('POST') || !$request->getPostParameter('PaymentEmployeeSettings'))
           return ;
        try 
        {
            $this->form->bind($request->getPostParameter('PaymentEmployeeSettings'));
            if ($this->form->isValid())
            {                            
                $this->getEventDispather()->notify(new mfEvent($this->form,'payment.employee.settings.load')); 
                PaymentEmployeeSettings::updateEmployee($this->form->getSettings(),$this->form->getMethod(), $this->getUser()->getGuardUser());
                $this->getEventDispather()->notify(new mfEvent($this->form,'payment.employee.settings.update'));           
                $messages->addInfo(__("Settings have been updated."));
            }
            else
            {
              $messages->addError(__("Form has some errors."));
             //  $this->settings->add($request->getPostParameter('Settings')); // Repopulate
             //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }
        }
        catch (mfException $e)
        {
          $messages->addError($e);
        }     
    }
    
   
}


