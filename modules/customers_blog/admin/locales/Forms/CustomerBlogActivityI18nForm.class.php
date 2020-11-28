<?php



 class CustomerBlogActivityI18nForm extends CustomerBlogActivityI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('activity_id', new mfValidatorInteger());
    }
    
 
}


