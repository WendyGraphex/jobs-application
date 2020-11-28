<?php

// www.project32.net/services/smsbox/callback/admin/return?reference=190430856742&numero=212661893794&accuse=0&ts=1558258066
// http://optic0.ewebsolutionskech-dev.com/services/smsbox/callback/admin/return?reference=190404886288&numero=212622035857&accuse=0&ts=1558258066
   
class services_smsbox_callback_returnAction extends mfAction {
    
        
    function execute(\mfWebRequest $request) {                      
        $settings = new SmsBoxSettings();                
        if (!$settings->getIps()->isEmpty() && !$settings->getIps()->in($request->getIP()))                
            $this->forwardTo401Action();          
        $form=new SmsBoxReturnForm();        
        $form->bind($request->getGetParameters());
        if ($form->isValid())
        {                                 
            $sms_return=new SmsBoxCallback(); 
            $sms_return->create($form->getValues());
           
            $sms=new SmsBoxSent(array('reference'=>$sms_return->get('reference'),'mobile'=>$sms_return->getMobile()));
            if ($sms->isNotLoaded())
                  return mfView::NONE;
            $sms->set('error_callback',$sms_return->get('accuse'));
            $sms->save();
            $this->getEventDispather()->notify(new mfEvent($sms,'smsbox.callback.return'));  
        }                      
        return mfView::NONE;
    }

}

