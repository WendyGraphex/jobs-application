<?php

require_once __DIR__."/../locales/FormFilters/SiteEventOrderPaymentFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SiteEventOrderPaymentPager.class.php";

class site_event_order_ajaxListPartialPaymentAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->formFilter= new SiteEventOrderPaymentFormFilter($this->user);                  
        $this->pager=new SiteEventOrderPaymentPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                // echo $this->formFilter->getQuery();
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);       
                $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);
     
    }
    
}