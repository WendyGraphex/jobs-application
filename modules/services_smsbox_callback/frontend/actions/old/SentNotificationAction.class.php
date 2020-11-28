<?php

class services_smsbox_callback_SentNotificationAction extends mfAction {

        
    function execute(\mfWebRequest $request) {   
        
        $settings = SmsBoxCallbackSettings::load();  
        
        if (!in_array($request->getIP(),$settings->getIpsServers()))
        {       
            $this->forwardTo401Action();  
        }
        
        try{
            $sms_sent = new SmsBoxSent($request->getPostParameters());
            $sms_call_back = new SmsBoxCallback();
            $sms_call_back->add($request->getPostParameters());
            $sms_call_back->save();
            $sms_sent->fillFromObject($sms_call_back);
            $sms_sent->save();
        }
        catch (mfException $ex)
        {
            throw new mfException($ex->getMessage());
        }
        
        return mfView::NONE;
    }

}

