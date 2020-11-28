<?php

require_once __DIR__."/../locales/FormFilters/PaymentEmployerUserFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/PaymentEmployerUserPager.class.php";

class payments_event_user_ajaxListPartialPaymentAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new PaymentEmployerUserFormFilter();                  
        $this->pager=new PaymentEmployerUserPager();
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