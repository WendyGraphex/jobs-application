<?php

 class CustomerAbuseTypeI18nForm extends CustomerAbuseTypeI18nBaseForm {
    
   
     function configure()
    {
        parent::configure();
        $this->setValidator('abuse_id', new mfValidatorInteger());
    }
}


