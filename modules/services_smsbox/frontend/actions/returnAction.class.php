<?php

class services_smsbox_returnAction extends mfAction {

        
    function execute(\mfWebRequest $request) {          
        // Access control        
        $settings=  SmsBoxSettings::load();        
        if (!in_array($request->getIP(),$settings->getIps()))
        {       
            trigger_error("ERROR SMS BOX IP=".$request->getIP().var_export($request->getGetParameters(),true));
           die(); // $this->forwardTo401Action();    
        }    
        $form=new SmsBoxReturnForm();        
        $form->bind($request->getGetParameters());
        if ($form->isValid())
        {
            $sms_return=new SmsBoxSent(array('reference'=>$form->getValue('reference')));
            $sms_return->set('mobile',$form->getValue('numero'));
            if ($sms_return->isNotLoaded())
                $sms_return->set('is_sent',($form->getValue('accuse')==9?"YES":"NO"));
            if ($form->getValue('accuse')==0)
                $sms_return->set('is_received',"YES");            
            $sms_return->setParameters($request->getGetParameters());
        }  
        else
        {        
           $sms_return=new SmsBoxSent();
           $sms_return->setErrors($request->getGetParameters());
           $sms_return->setParameters($request->getGetParameters());
           trigger_error(var_export($request->getGetParameters(),true));  
        }    
      //  trigger_error(var_export($request->getGetParameters(),true));  
        $sms_return->save();
        return mfView::NONE;
    }

}

