<?php

require_once __DIR__."/../locales/FormFilters/SaleEmployeeQuotationForEmployeeFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/SaleEmployeeQuotationForEmployeePager.class.php";


class sales_quotation_ajaxListPartialQuotationForEmployeeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) { 
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
            $this->forwardTo401Action();
        
        $this->user=$this->getUser();
        $messages = mfMessages::getInstance();              
        $this->formFilter= new SaleEmployeeQuotationForEmployeeFormFilter($request->getPostParameter('filter'));                                     
        $this->pager=new SaleEmployeeQuotationForEmployeePager();        
       // $this->item=new SaleEmployeeQuotation($request->getPostParameter('SaleEmployeeQuotation'),$this->getUser()->getGuardUser());
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                 // echo $this->formFilter->getQuery();
                 //  echo $this->formFilter['nbitemsbypage'];
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                    $this->pager->setParameter('lang',$this->getUser()->getLanguage());    
                    $this->pager->setParameter('employee_user_id',$this->getUser()->getGuardUser()->get('id'));
                    $this->pager->setPage($request->getGetParameter('page'));
                   
                    $this->pager->execute();    
                    
                  //  echo $this->formFilter['nbitemsbypage'];
                    
             //   echo mfSiteDatabase::getInstance()->getQuery();
               }               
               else
               {
                 // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
                   $messages->addError(__("Filter has errors."));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        } 
        
      
      //  echo "<pre>"; var_dump($this->pager->getItems());
    }
}

