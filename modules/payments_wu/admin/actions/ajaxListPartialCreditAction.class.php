<?php

require_once __DIR__."/../locales/FormFilters/PaymentEmployeeUserWuFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/PaymentEmployeeUserWuPager.class.php";

class payments_wu_ajaxListPartialCreditAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new PaymentEmployeeUserWuFormFilter();                  
        $this->pager=new PaymentEmployeeUserWuPager();
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
              //  echo               mfSiteDatabase::getInstance()->getQuery();
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }  
    }
    
}    