<?php


class payments_listCountryActionComponent extends mfActionComponent {
     
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
              $this->countries_available=$settings->get('countries_available');           
           $this->countries_authorized=$this->payment->getCountries();
           $this->zones=  mfCountryInfo::getTranslatedPoliticalZones();         
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }       
    }
                    
}    