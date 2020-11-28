<?php

 
class employees_work_ajaxGenerateRequestsAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        try
        {
           $engine= new EmployeeWorkGeneratorEngine();
           $engine->process();  
           $messages->addInfo($engine->getNumberOfWorks()->getChoices('[0]no request has been processed|[1]one request has been processed|(1,Inf]%s requests has been processed'));
        }
        catch (mfException $e)
        {
            $messages->addError($e->getMessage()); 
        }
        $this->forward($this->getModuleName(), 'ajaxListPartialWork');
    }
    
}    