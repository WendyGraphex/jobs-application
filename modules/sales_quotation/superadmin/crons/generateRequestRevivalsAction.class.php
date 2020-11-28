<?php

class sales_quotation_generateRequestRevivalsAction extends cronAction {
    
    function execute()
    {                    
          try
          {
              if (!mfModule::isModuleInstalled('sales_quotation'))
                  return ;              
              $engine = new EmployerQuotationRequestRevivalManagerEngine();
              $engine->cron(); 
              $this->getCron()->getReport()->addMessage(__('Employer Quotation Request Revivals have been processed (%s).',$engine->getRequests()->count()));
          }
          catch (Exception $e)
          {
              $this->getCron()->getReport()->addMessage($e->getMessage());
          }     
    }
}
