<?php



 class CustomerClaimTypeI18nForm extends CustomerClaimTypeI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('type_id', new mfValidatorInteger());
    }
    
 
}


