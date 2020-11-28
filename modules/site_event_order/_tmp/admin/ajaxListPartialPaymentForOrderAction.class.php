<?php

require_once __DIR__."/../locales/FormFilters/PaymentEmployerUserFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/PaymentEmployerUserPager.class.php";

class site_event_order_ajaxListPartialPaymentForOrderAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->order=new SaleOrder($request->getPostParameter('SaleOrder'));                
          if ($this->order->isNotLoaded())
           return ;
        $this->formFilter= new PaymentEmployerUserFormFilter();                  
        $this->pager=new PaymentEmployerUserPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                             
                $this->pager->setParameter('order_id',$this->order->get('id'));                
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