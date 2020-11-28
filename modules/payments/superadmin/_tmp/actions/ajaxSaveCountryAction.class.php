<?php

class CountryCollectionForm extends mfForm {
           
    public function configure() {
        
       $this->setValidators(array(
           "countries"=>new mfValidatorSchemaForEach(new mfValidatorChoiceCountry(), count($this->getDefault('countries')))
           ));            
    }
        
}

class payments_ajaxSaveCountryAction extends mfAction {
    
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
             $form=new CountryCollectionForm($request->getPostParameter('countries'));             
             $form->bind($request->getPostParameter('countries'));     
             if ($form->isValid())
             {               
                 $payment->updateCountries($form['countries']->getValue());
                 $response=array('info'=>__('countries updated.'));
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

