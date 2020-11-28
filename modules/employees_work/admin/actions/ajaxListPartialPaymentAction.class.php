<?php

require_once __DIR__."/../locales/FormFilters/EmployeeWorkPaymentRequestFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeeWorkPaymentRequestPager.class.php";

class employees_work_ajaxListPartialPaymentAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->date = $request->getRequestParameter('date');
        $this->formFilter= new EmployeeWorkPaymentRequestFormFilter();                  
        $this->pager=new EmployeeWorkPaymentRequestPager();
        try
        {
               
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
               // echo $this->formFilter->getQuery();
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
       //  var_dump($this->formFilter['in']['status']->in(null,'selected'));
    }
    
}    