<?php

require_once __DIR__."/../locales/FormFilters/EmployeeWorkPaymentRequestForWorkFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeeWorkPaymentRequestForWorkPager.class.php";

class employees_work_ajaxListPartialPaymentForWorkAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
        $this->work= new EmployeeWork($request->getPostParameter('EmployeeWork'));
        if ($this->work->isNotLoaded())
            return ;
        
        $this->formFilter= new EmployeeWorkPaymentRequestForWorkFormFilter();                  
        $this->pager=new EmployeeWorkPaymentRequestForWorkPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);    
                $this->pager->setParameter('work_id',$this->work->get('id'));
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
