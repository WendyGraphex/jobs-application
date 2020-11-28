<?php

class services_smsbox_callback_ReturnCallbackServerAction extends mfAction {

        
    function execute(\mfWebRequest $request) {          
             
        //verifie host  est bien superadmin 
        die(__METHOD__);
        
        $settings= SmsBoxCallbackSettings::load();        
        if ($request->getIP()!=$settings->get("ip_utils"))
        {       
            $this->forwardTo401Action();    
        }
        
        try
        {
           // $sms = new SmsBoxSent($request->getPostParameters());
           // $sms->add($request->getPostParameters());
           // $this->getEventDispather()->notify(new mfEvent($sms, 'sms.callback.notify',$request->getPostParameters()));
        }
        catch (mfException $ex)
        {
            throw new mfException($ex->getMessage());
        }
        
        return mfView::NONE;
    }

}

