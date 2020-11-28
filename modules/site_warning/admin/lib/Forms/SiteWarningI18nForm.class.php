<?php

 class SiteWarningI18nForm extends SiteWarningI18nBaseForm {
    
   
     function configure()
    {
        parent::configure();
        $this->setValidator('warning_id', new mfValidatorInteger());
    }
}


