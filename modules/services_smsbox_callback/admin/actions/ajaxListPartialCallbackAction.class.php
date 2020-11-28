<?php

require_once dirname(__FILE__).'/../locales/FormFilters/SmsBoxCallbackFormFilter.class.php';
require_once dirname(__FILE__).'/../locales/Pagers/SmsBoxCallbackPager.class.php';

class services_smsbox_callback_ajaxListPartialCallbackAction extends mfAction {

//    const SITE_NAMESPACE = 'system/site';
    
    function execute(mfWebRequest $request) {
        
//        $this->site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);       
        $messages = mfMessages::getInstance();                     
        $this->formFilter = new SmsBoxCallbackFormFilter();
        $this->pager = new SmsBoxCallbackPager();
        
        try
        {
            $this->formFilter->bind($request->getPostParameter('filter'));
            if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
            {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                             
                $this->pager->setPage($request->getGetParameter('page'));
                // host
                $this->pager->execute();                
            }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }         
        
    }

}

