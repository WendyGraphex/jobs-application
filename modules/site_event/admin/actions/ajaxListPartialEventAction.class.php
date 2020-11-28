<?php

require_once dirname(__FILE__)."/../locales/FormFilters/SiteEventFormFilter.class.php";
require_once dirname(__FILE__)."/../locales/Pagers/SiteEventPager.class.php";

class site_event_ajaxListPartialEventAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
         $this->formFilter = new SiteEventFormFilter($request->getRequestParameter('lang',$request->getPostParameter('lang',$this->getUser()->getLanguage())));                  
        $this->pager=new SiteEventPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                             
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->setParameter('lang',$this->formFilter->getLanguage()); 
                $this->pager->execute();                              
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }   
    }
    
}    