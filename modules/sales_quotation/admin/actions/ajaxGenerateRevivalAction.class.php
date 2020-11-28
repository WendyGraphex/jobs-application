<?php


class sales_quotation_ajaxGenerateRevivalAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();        
        try
        {
              $engine=new EmployerQuotationRequestRevivalManagerEngine();
              $engine->process();
              
              $messages->addInfo(__('%s revival(s) has(ve) been generated.',$engine->getRequests()->count()))  ;
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }            
        $this->forward($this->getModuleName(), 'ajaxListPartialRequest');
    }
    
}
