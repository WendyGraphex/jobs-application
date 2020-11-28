<?php

require_once dirname(__FILE__)."/../locales/FormFilters/PaymentEmployeeMethodFormFilter.class.php";
require_once dirname(__FILE__)."/../locales/Pagers/PaymentEmployeeMethodPager.class.php";

class payments_employee_ajaxListPartialMethodAction extends mfAction {


   
        
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new PaymentEmployeeMethodFormFilter();                  
        $this->pager=new PaymentEmployeeMethodPager();
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