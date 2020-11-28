<?php


class employees_work_ajaxDialogWorkForProjectAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $this->work= new EmployeeWork($request->getPostParameter('EmployeeWork'));
        if ($this->work->isNotLoaded())
            return ;
               
    }

}
