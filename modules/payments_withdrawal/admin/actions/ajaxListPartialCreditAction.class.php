<?php

require_once __DIR__."/../locales/FormFilters/PaymentEmployeeUserWithdrawalFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/PaymentEmployeeUserWithdrawalPager.class.php";

class payments_withdrawal_ajaxListPartialCreditAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new PaymentEmployeeUserWithdrawalFormFilter();                  
        $this->pager=new PaymentEmployeeUserWithdrawalPager();
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
              //  echo               mfSiteDatabase::getInstance()->getQuery();
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }  
    }
    
}    