<?php

class payments_employee_listActionComponent extends mfActionComponent {
    
    
    function execute(mfWebRequest $request)
    {       
        $this->settings= PaymentEmployeeSettings::getSettings()->getAll();              
    } 
    
   
}

