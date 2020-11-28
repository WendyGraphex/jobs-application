<?php


class payments_listCurrenciesActionComponent extends mfActionComponent {
     
    const SITE_NAMESPACE = 'system/site';
     
    function execute(mfWebRequest $request) {                          
        $messages = mfMessages::getInstance();       
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);   
        if (!$site)
            return mfView::NONE;
        try
        {            
           $this->payment=new payment(strtolower($this->getParameter('module')),$site);
           if ($this->payment->isNotLoaded())
               return mfView::NONE;
           if (($settings=$this->payment->getSettings()))
              $this->currencies_available=$settings->get('currencies_available');
            $this->currencies_authorized=$this->payment->getCurrencies();                     
            $this->currencies=mfCountryInfo::getCurrencies();  
          //  var_dump($this->currencies);
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }             
    }
                    
}    