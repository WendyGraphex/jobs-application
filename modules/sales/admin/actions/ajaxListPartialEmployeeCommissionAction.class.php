<?php

require_once __DIR__."/../locales/FormFilters/SaleEmployeeCommissionFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SaleEmployeeCommissionPager.class.php";

class sales_ajaxListPartialEmployeeCommissionAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();        
        $this->formFilter= new SaleEmployeeCommissionFormFilter();                  
        $this->pager=new SaleEmployeeCommissionPager();      
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
               else
               {
                   $messages->addError(__('Filter has some errors.'));
                   // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);
     
    }
    
}
