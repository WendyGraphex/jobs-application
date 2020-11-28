<?php

require_once __DIR__."/../locales/FormFilters/EmployeeWorkPaymentRequestForEmployeeFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeeWorkPaymentRequestForEmployeePager.class.php";

class employees_work_ajaxListPartialRequestForEmployeeAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {          
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();            
        $this->formFilter= new EmployeeWorkPaymentRequestForEmployeeFormFilter($this->getUser()->getStorage()->read('payment'),$request->getPostParameter('filter'));                  
        $this->pager=new EmployeeWorkPaymentRequestForEmployeePager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {             
                //   echo $this->formFilter->getQuery();
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
              //  $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setParameter('employee_user_id',$this->getUser()->getGuardUser()->get('id'));
              //  $this->pager->setParameter('quotation_id',$this->project->getQuotation()->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
              //    echo mfSiteDatabase::getInstance()->getQuery();
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }   
    }
    
   
}

