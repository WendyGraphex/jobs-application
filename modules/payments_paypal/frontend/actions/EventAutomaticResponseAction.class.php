<?php

// www.project55.net/payments/paypal/return
 
require_once __DIR__."/../locales/Forms/AutomaticResponseReturnEventForm.class.php";
     
class payments_paypal_AutomaticResponseAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();           
       //  file_put_contents(mfConfig::get('mf_cache_dir')."/log_get.txt", var_export($request->getGetParameters(),true));
      //   file_put_contents(mfConfig::get('mf_cache_dir')."/log_post.txt", var_export($request->getPostParameters(),true));
      //   file_put_contents(mfConfig::get('mf_cache_dir')."/log_content.txt", $request->getContent());
        
          // $data = file_get_contents(__DIR__."/../data/hook1.json");
       // $key = "EC-3D2202698D783170X"; // PAYID-L6WXKCI9MR376230G3360315
        
         
        $form = new AutomaticResponseReturnEventForm();
         $form->bind(array('data'=>$request->getContent(),'key'=>$request->getGetParameter('key')));     
      //  $form->bind(array('data'=>$data,'key'=>$key));
         if ($form->isValid())
         {
            // echo "<pre>"; var_dump($form->getValues(),$form->getTransactionFee(),$form->getTransactionFeeCurrency());
             // echo "OK";
             $form->getPaymentEventUser()->setFee($form->getTransactionFee(),$form->getTransactionFeeCurrency());
             $form->getPaymentEventUser()->accepted();           
             $form->getPaymentEventUser()->getOrder()->paid();       
             $this->getEventDispather()->notify(new mfEvent($form->getPaymentEventUser(),'payment.event.accepted'));
         }    
         else
         {                 
            $settings=new PaypalSettings();                
            $item=new PaymentEventUser(array('reference'=>$request->getGetParameter('key'),'payer'=>$settings->getPayerID()));     
          //  $item=new PaymentEmployerUser(array('reference'=>$key,'payer'=>$settings->getPayerID()));    
            if ($item->isLoaded())
            {                  
               $item->getHookFile()->putContent("GET=".var_export($request->getGetParameters(),true)."\n".$request->getContent());
            }
         }             
         die();
    }
   
}

