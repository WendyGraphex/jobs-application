<?php



 class SystemModelTextI18nForm extends SystemModelTextI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('model_id', new mfValidatorInteger());
    }
    
 
}


