<?php


class employees_messager_firstActionComponent extends mfActionComponent {

    function execute(mfWebRequest $request)
    {                
           $this->employee=$this->getParameter('employee_user')->getFormatter()->toArrayForEmail();                      
           $this->model_i18n= $this->getParameter('model_i18n');                        
    } 
    
    
}