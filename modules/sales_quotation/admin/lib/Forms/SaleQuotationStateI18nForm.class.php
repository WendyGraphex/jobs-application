<?php



 class SaleQuotationStateI18nForm extends SaleQuotationStateI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('state_id', new mfValidatorInteger());
    }
    
 
}


