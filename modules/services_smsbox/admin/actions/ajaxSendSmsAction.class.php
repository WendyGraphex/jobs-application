<?php

require_once dirname(__FILE__)."/../locales/Forms/SendSmsForm.class.php";

class services_smsbox_ajaxSendSmsAction extends mfAction {

         
     function execute(\mfWebRequest $request) {
        $messages = mfMessages::getInstance();                             
        try 
        {          
      
            $form=new SendSmsForm();
            $form->bind($request->getPostParameter('SmsTest'));

            if ($form->isValid())
            {
                $sms=new SmsBoxApi(array()); 
                $sms_sent = new SmsBoxSent();

                if ($sms->send($form['mobile']->getValue(),$form['message']->getValue()) && !$sms->hasError())
                {                                  
                    $sms_sent->setResponseFromApiAndSave((string)$form['mobile'],(string)$form['message'],$sms);                                       
                    $this->getEventDispather()->notify(new mfEvent($sms_sent, 'sms.sent.notify'));
                    $response = array("action"=>"SendSms","info"=>__("SMS has been sent."));        
                }
                else
                {
                    $response=array('error'=>$sms->getError());
                    $sms_sent->setResponseFromApiAndSave((string)$form['mobile'],(string)$form['message'],$sms);
                    throw new mfException(__("SMS can not be transmitted."));
                }
            }  
            else
            {
             //  var_dump($form->getErrorSchema()->getErrorsMessage());
                throw new mfException(__("Form has some errors."));           
            }             
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

