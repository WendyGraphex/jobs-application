<?php

class SmsBoxCallbackEvents  {
    
    static function smsSent(mfEvent $event)
    {        
        $sms=$event->getSubject();
        
        if (!mfModule::isModuleInstalled('services_smsbox_callback',$sms->getSite()))
            return;         
        //utilisé l'api callback
        $api = new SmsBoxCallbackApi();
        $url = SmsBoxCallbackSettings::load()->get("host_utils").SmsBoxCallbackSettings::load()->get("action_callback_sent");
        //besoin du site actuelle et du site du serveur utils
        $api->send($url, $sms->toArrayForNotify());
    }
    
}
