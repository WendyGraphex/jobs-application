<?php


class payments_listCurrencyActionComponent extends mfActionComponent {
     
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
              $this->currencies_authorized=$settings->get('currencies_authorized');      
           $this->form=new CurrencySettingsForm();
           $this->form->setCurrencies($this->currencies_authorized);
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }             
    }
                    
}    