<?php

class employees_work_generateEmailsAction extends cronAction {
    
    function execute()
    {                    
          try
          {
              if (!mfModule::isModuleInstalled('employees_work'))
                  return ;              
              $engine = new EmployeeWorkEmailManagerEngine();
              $engine->cron(); 
              $this->getCron()->getReport()->addMessage(__('Works have been processed (%s).',$engine->getRequests()->count()));
          }
          catch (Exception $e)
          {
              $this->getCron()->getReport()->addMessage($e->getMessage());
          }     
    }
}
