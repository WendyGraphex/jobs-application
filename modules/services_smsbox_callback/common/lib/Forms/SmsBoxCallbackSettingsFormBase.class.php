<?php


class SmsBoxCallbackSettingsFormBase extends mfFormSite {
    
    function configure()
    {
//        $this->setOption('disabledCSRF',true);
        $this->setValidators(array(
           'ip_utils'=>new mfValidatorIp(),
           'ips_servers'=>new mfValidatorSmsBoxCallbackIpsSchema(),//mfValidatorSchemaForEach(new mfValidatorIp(),count($this->getDefault('ips_servers'))),
           'url_send_test'=>new mfValidatorString(),
           'url_callback_test'=>new mfValidatorString(),
           'action_callback_sent' =>new mfValidatorString(),              
           'action_callback_return' =>new mfValidatorString(),              
           'host_utils' => new mfValidatorUrl(),              
           'action_utils' => new mfValidatorString(),              
        ));  
    }
}