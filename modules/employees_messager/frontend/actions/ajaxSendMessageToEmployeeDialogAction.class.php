<?php

 
class employees_messager_ajaxSendMessageToEmployeeDialogAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forward('employers','ajaxLoginDialog');        
        $messages= mfMessages::getInstance();     
        $this->employee= new Employee(new mfString($request->getPostParameter('EmployeeMessageDialog')));      
        $this->max_characters=500;
    }
    
   
}



