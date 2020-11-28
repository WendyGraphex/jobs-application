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
//                $sms_log = new SmsBoxLog();
                $sms_sent = new SmsBoxSent();
                if ($sms->send($form['mobile']->getValue(),$form['message']->getValue()) && !$sms->hasError())
                {
//                    var_dump($sms->hasError());
                    $response = array("action"=>"SendSms","info"=>__("SMS has been sent."));
                    $sms_sent->add($form->getValues());
                    $sms_sent->set("reference",$sms->getReference());
                    $sms_sent->setParameters($sms->getParameters());
                    $sms_sent->set("is_sent","YES");
                    $sms_sent->save();
                    $this->getEventDispather()->notify(new mfEvent($sms_sent, 'sms.sent.notify'));
                }
                else
                {
                    $sms_sent->add($form->getValues());
//                    $sms_log->add($form->getValues());
//                    $sms_sent->set("reference","");
                    $sms_sent->setParameters($sms->getParameters());
                    $sms_sent->setErrorApi($sms->getResponse());
                    $sms_sent->save();
                    throw new mfException(__("SMS can not be transmitted."));
                }
            }  
            else
            {
//                var_dump($form->getErrorSchema()->getErrorsMessage());
                throw new mfException(__("Form has some errors."));           
            }             
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
      }

}

