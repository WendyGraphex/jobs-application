<?php


class employees_work_ajaxClearWorksAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                    
        try 
        {                       
           //   EmployeeWork::deleteAll();         
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        $messages->addInfo(__('Works have been processed.'));
        $this->forward($this->getModuleName(), 'ajaxListPartialWork'); 
    }

}
