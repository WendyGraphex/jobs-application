<?php

require_once __DIR__."/../locales/FormFilters/PaymentWesternUnionFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/PaymentWesternUnionPager.class.php";

class payments_wu_ajaxListPartialPaymentAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new PaymentWesternUnionFormFilter();                  
        $this->pager=new PaymentWesternUnionPager();
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