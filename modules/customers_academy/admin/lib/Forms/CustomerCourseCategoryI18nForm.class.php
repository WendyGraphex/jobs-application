<?php



 class CustomerCourseCategoryI18nForm extends CustomerCourseCategoryI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('category_id', new mfValidatorInteger());
    }
    
 
}


