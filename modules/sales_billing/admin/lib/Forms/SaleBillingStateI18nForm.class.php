<?php



 class SaleBillingStateI18nForm extends SaleBillingStateI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('state_id', new mfValidatorInteger());
    }
    
 
}


