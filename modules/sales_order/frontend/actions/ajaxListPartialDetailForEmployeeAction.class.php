<?php

require_once __DIR__."/../locales/FormFilters/SaleOrderDetailForEmployeeFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SaleOrderDetailForEmployeePager.class.php";


class sales_order_ajaxListPartialDetailForEmployerAction extends mfAction {
 
   
   function execute(mfWebRequest $request) {
        if ($this->getUser()->isAuthenticated() && !$this->getUser()->isEmployee())          
                $this->forwardTo401Action();
         $messages = mfMessages::getInstance();     
        $this->order=new SaleOrder($request->getPostParameter('SaleOrder'),$this->getUser()->getGuardUser());
        if ($this->order->isNotLoaded())
            return ;
        $this->user=$this->getUser();           
        $this->formFilter= new SaleOrderDetailForEmployeeFormFilter();                  
        $this->pager=new SaleOrderDetailForEmployeePager();        
        if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
        {    
            $this->pager->setQuery($this->formFilter->getQuery()); 
            $this->pager->setNbItemsByPage(10);   
            $this->pager->setParameter('employee_user_id',$this->getUser()->getGuardUser()->get('id'));
            $this->pager->setParameter('order_id',$this->order->get('id'));
            $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                     
            $this->pager->setPage($request->getGetParameter('page'));
            $this->pager->execute();           
           // echo mfSiteDatabase::getInstance()->getQuery();
        }   
    }
    
}
