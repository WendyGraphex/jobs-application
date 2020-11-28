<?php


class employees_work_ajaxClearRequestsAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                    
        try 
        {                       
              EmployeeWorkPaymentRequest::deleteAll();         
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        $messages->addInfo(__('All Requests have been removed.'));
        $this->forward($this->getModuleName(), 'ajaxListPartialWork'); 
    }

}
