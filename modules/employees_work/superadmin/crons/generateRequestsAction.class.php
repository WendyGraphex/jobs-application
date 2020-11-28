<?php

class employees_work_generateRequestsAction extends cronAction {
    
    function execute()
    {                    
          try
          {
              if (!mfModule::isModuleInstalled('employees_work'))
                  return ;              
              $engine= new EmployeeWorkGeneratorEngine();
              $engine->cron();  
              
              $this->getCron()->getReport()->addMessage(__('Works have been processed (%s).',$engine->getWorks()->count()));
          }
          catch (Exception $e)
          {
              $this->getCron()->getReport()->addMessage($e->getMessage());
          }     
    }
}
