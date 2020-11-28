<?php

require_once __DIR__."/../locales/FormFilters/PaymentCheckFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/PaymentCheckPager.class.php";

class payments_check_ajaxListPartialPaymentAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new PaymentCheckFormFilter();                  
        $this->pager=new PaymentCheckPager();
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