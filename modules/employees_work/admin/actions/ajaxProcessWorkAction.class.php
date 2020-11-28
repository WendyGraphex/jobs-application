<?php

 
class employees_work_ajaxProcessWorkAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        try
        {
            $work = new EmployeeWork($request->getPostParameter('EmployeeWork'));
            if ($work->isNotLoaded())
                throw new mfException(__('Work is invalid'));
            
            $work->getEngine()->process();
            $messages->addInfo($work->isCompleted()?__('Work is completed.'):__('Work has been processed.'));
        }
        catch (mfException $e)
        {
            $messages->addError($e->getMessage()); 
        }
        $this->forward($this->getModuleName(), 'ajaxListPartialWork');
    }
    
}    