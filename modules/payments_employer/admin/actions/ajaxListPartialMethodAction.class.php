<?php

require_once dirname(__FILE__)."/../locales/FormFilters/PaymentEmployerMethodFormFilter.class.php";
require_once dirname(__FILE__)."/../locales/Pagers/PaymentEmployerMethodPager.class.php";

class payments_employer_ajaxListPartialMethodAction extends mfAction {


   
        
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new PaymentEmployerMethodFormFilter();                  
        $this->pager=new PaymentEmployerMethodPager();
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