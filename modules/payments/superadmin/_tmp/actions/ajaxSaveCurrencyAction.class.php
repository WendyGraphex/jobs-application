<?php


class payments_ajaxSaveCurrencyAction extends mfAction {
    
     const SITE_NAMESPACE = 'system/site';
     
    function execute(mfWebRequest $request) {                          
        $messages = mfMessages::getInstance();       
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);   
        $this->forwardIf(!$site,"sites","ajaxAdmin");                 
        try
        {
           $payment=new payment("payments_".strtolower($request->getRequestParameter('payment')),$site);          
           if ($payment->isLoaded())
           {                                   
              if (($settings=$payment->getSettings()))
                   $currencies_authorized=$settings->get('currencies_authorized');          
              $form=new CurrencySettingsForm();
              $form->setCurrencies($currencies_authorized);
              $form->bind($request->getPostParameter('Currency'));
              if ($form->isValid())
              {
                 $settings->set('currency',(string)$form['currency']);
                 $settings->save();
                 $response=array('info'=>__('currency is updated.'));
              }                                
           }               
        }
        catch (mfException $e)
        {
            $messages->addError($e);           
        }              
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

