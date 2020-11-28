<?php

class SmsBoxSettingsAdminForm extends SmsBoxSettingsForm {
 
   
    function configure()
    {
        parent::configure();
        unset($this['ips']);       
    }
}


