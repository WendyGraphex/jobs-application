<?php



 class PartnerWorkCategoryI18nForm extends PartnerWorkCategoryI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('category_id', new mfValidatorInteger());
    }
    
 
}


