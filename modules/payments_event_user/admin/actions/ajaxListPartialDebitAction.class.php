<?php

require_once __DIR__."/../locales/FormFilters/PaymentDebitEventUserFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/PaymentDebitEventUserPager.class.php";

class payments_event_user_ajaxListPartialDebitAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new PaymentDebitEventUserFormFilter();                  
        $this->pager=new PaymentDebitEventUserPager();
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