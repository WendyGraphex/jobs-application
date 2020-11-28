<?php


class employees_ajaxGenerateRevivalAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();        
        try
        {           
              $engine=new EmployeeAdvertRevivalManagerEngine();
              $engine->process();
              
              $messages->addInfo(__('%s revival(s) has(ve) been generated.',$engine->getAdverts()->count()))  ;
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }            
        $this->forward($this->getModuleName(), 'ajaxListPartialAdvert');
    }
    
}
