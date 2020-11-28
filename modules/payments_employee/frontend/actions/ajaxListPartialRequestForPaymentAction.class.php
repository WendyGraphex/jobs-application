<?php

require_once __DIR__."/../locales/FormFilters/EmployeeWorkPaymentRequestForPaymentFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeeWorkPaymentRequestForPaymentPager.class.php";

class payments_employee_ajaxListPartialRequestForPaymentAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();  
         if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
         $this->payment= new PaymentEmployee($request->getPostParameter('PaymentEmployee'),$this->getUSer()->getGuardUser());    
        if ($this->payment->isNotLoaded())
              return ;        
        $this->formFilter= new EmployeeWorkPaymentRequestForPaymentFormFilter();                  
        $this->pager=new EmployeeWorkPaymentRequestForPaymentPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                             
                $this->pager->setParameter('payment_id',$this->payment->get('id'));  
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