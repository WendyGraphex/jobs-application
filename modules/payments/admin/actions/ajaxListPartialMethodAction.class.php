<?php

require_once dirname(__FILE__)."/../locales/FormFilters/PaymentMethodFormFilter.class.php";
require_once dirname(__FILE__)."/../locales/Pagers/PaymentMethodPager.class.php";

class payments_ajaxListPartialMethodAction extends mfAction {


   
        
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new PaymentMethodFormFilter();                  
        $this->pager=new PaymentMethodPager();
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