<?php

 class SiteHelpI18nForm extends SiteHelpI18nBaseForm {
    
   
     function configure()
    {
        parent::configure();
        $this->setValidator('help_id', new mfValidatorInteger());
    }
}


