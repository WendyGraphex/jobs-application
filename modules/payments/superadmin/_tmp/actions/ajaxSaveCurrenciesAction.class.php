<?php

class CurrencyCollectionForm extends mfForm {
        
    public function configure() {
        
       $this->setValidators(array(
         //  "currencies"=>new mfValidatorSchemaForEach(new mfValidatorChoice(array("choices"=>$this->getOption("choices"))), count($this->getDefault('currencies')))
             "currencies"=>new mfValidatorSchemaForEach(new mfValidatorChoiceCurrency(), count($this->getDefault('currencies')))
           ));            
    }
    
    
}

class payments_ajaxSaveCurrenciesAction extends mfAction {
    
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
             $form=new CurrencyCollectionForm($request->getPostParameter('currencies')); //,array("choices"=>$payment->getSettings()->get('currencies_available')));             
             $form->bind($request->getPostParameter('currencies'));     
             if ($form->isValid())
             {              
                 //var_dump($form['currencies']->getValue());                 
                 $payment->updateCurrencies($form['currencies']->getValue());
                 $response=array('info'=>__('currencies updated.'));
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

