<?php

require_once __DIR__."/../locales/FormFilters/PaymentWithdrawalFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/PaymentWithdrawalPager.class.php";

class payments_withdrawal_ajaxListPartialPaymentAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new PaymentWithdrawalFormFilter();                  
        $this->pager=new PaymentWithdrawalPager();
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