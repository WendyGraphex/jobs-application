<?php

class emailer_spooler_updateAction extends cronAction {
    
    function execute()
    {                    
          try
          {
              if (!mfModule::isModuleInstalled('emailer_spooler'))
                  return ;              
              $scheduler=new EmailerSpoolerScheduler();
              $scheduler->process(); 
              $this->getCron()->getReport()->addMessage(__('Emails have been sent (%s).',$scheduler->get('number_of_emails_sent')));
          }
          catch (Exception $e)
          {
              $this->getCron()->getReport()->addMessage($e->getMessage());
          }     
    }
}
