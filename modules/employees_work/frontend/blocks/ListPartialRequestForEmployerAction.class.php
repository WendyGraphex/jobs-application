<?php

require_once __DIR__."/../locales/FormFilters/EmployeeWorkPaymentRequestForEmployerFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeeWorkPaymentRequestForEmployerPager.class.php";

class employees_work_ListPartialRequestForEmployerActionComponent extends mfActionComponent {
    
             
    function execute(mfWebRequest $request) {            
             
        $this->formFilter= new EmployeeWorkPaymentRequestForEmployerFormFilter();                  
        $this->pager=new EmployeeWorkPaymentRequestForEmployerPager();
        try
        {
               
                //   echo $this->formFilter->getQuery();
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
              //  $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setParameter('employer_user_id',$this->getUser()->getGuardUser()->get('id'));
                $this->pager->setParameter('quotation_id',$request->getRequestParameter('project')->getQuotation()->get('id'));
              //  $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
                                                 
        }
        catch (mfException $e)
        {
             
        }   
    }
    
   
}

