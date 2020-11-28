<?php

class payments_ajaxViewTextI18nAction extends mfAction {
    
     const SITE_NAMESPACE = 'system/site';
     
    function execute(mfWebRequest $request) {                          
        $messages = mfMessages::getInstance();       
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);
        $this->forwardIf(!$site,"sites","ajaxAdmin"); 
        $class="payment".ucfirst(strtolower($request->getRequestParameter('payment')))."TextI18n";
        if (!class_exists($class))
             $this->forward404();   
        $this->payment=strtolower($request->getRequestParameter('payment'));
        try
        {        
           $this->item=new $class($request->getPostParameter('textI18n'),$site);                                     
           $this->language=$this->getUser()->getLanguage();
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }                  
    }

}

