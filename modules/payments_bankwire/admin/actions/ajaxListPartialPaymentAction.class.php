<?php

require_once __DIR__."/../locales/FormFilters/PaymentBankwireFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/PaymentBankwirePager.class.php";

class payments_bankwire_ajaxListPartialPaymentAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new PaymentBankwireFormFilter();                  
        $this->pager=new PaymentBankwirePager();
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