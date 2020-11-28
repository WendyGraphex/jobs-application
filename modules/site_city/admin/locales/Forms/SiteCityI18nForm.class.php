<?php



 class SiteCityI18nForm extends SiteCityI18nBaseForm {
    
    
   
    function configure()
    {
        parent::configure();
        $this->setValidator('city_id', new mfValidatorInteger());
    }
    
 
}


