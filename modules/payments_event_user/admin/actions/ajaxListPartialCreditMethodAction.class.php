<?php

require_once dirname(__FILE__)."/../locales/FormFilters/PaymentCreditEventUserMethodFormFilter.class.php";
require_once dirname(__FILE__)."/../locales/Pagers/PaymentCreditEventUserMethodPager.class.php";

class payments_event_user_ajaxListPartialCreditMethodAction extends mfAction {


   
        
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new PaymentCreditEventUserMethodFormFilter();                  
        $this->pager=new PaymentCreditEventUserMethodPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                             
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }  
    }
    
}    