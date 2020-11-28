<?php

class employees_generateRevivalsAction extends cronAction {
    
    function execute()
    {                    
          try
          {
              if (!mfModule::isModuleInstalled('employees'))
                  return ;              
              $engine = new EmployeeAdvertRevivalManagerEngine();
              $engine->cron(); 
              $this->getCron()->getReport()->addMessage(__('Employee Advert Revivals have been processed (%s).',$engine->getAdverts()->count()));
          }
          catch (Exception $e)
          {
              $this->getCron()->getReport()->addMessage($e->getMessage());
          }     
    }
}
