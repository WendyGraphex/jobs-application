<?php

class employers_generateRevivalsAction extends cronAction {
    
    function execute()
    {                    
          try
          {
              if (!mfModule::isModuleInstalled('employers'))
                  return ;              
              $engine = new EmployerAdvertRevivalManagerEngine();
              $engine->cron(); 
              $this->getCron()->getReport()->addMessage(__('Employer Advert Revivals have been processed (%s).',$engine->getAdverts()->count()));
          }
          catch (Exception $e)
          {
              $this->getCron()->getReport()->addMessage($e->getMessage());
          }     
    }
}
