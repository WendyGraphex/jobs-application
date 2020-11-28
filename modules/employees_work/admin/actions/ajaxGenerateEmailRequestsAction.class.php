<?php


class employees_work_ajaxGenerateEmailRequestsAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                    
        try 
        {                       
              $engine = new EmployeeWorkEmailManagerEngine();
              $engine->process();
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        $messages->addInfo(__('%s request(s) has(have) been generated.',$engine->getRequests()->count()));
        $this->forward($this->getModuleName(), 'ajaxListPartialWork'); 
    }

}
