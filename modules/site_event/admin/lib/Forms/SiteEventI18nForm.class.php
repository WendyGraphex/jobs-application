<?php

 class SiteEventI18nForm extends SiteEventI18nBaseForm {
    
   
     function configure()
    {
        parent::configure();
        $this->setValidator('event_id', new mfValidatorInteger());
    }
}


