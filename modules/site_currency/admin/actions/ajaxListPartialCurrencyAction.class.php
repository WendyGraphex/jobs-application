<?php

 require_once __DIR__."/../locales/FormFilters/SiteCurrencyFormFilter.class.php";
 
class site_currency_ajaxListPartialCurrencyAction extends mfAction {
        
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();                 
        $this->formFilter= new SiteCurrencyFormFilter();
        $this->pager=new Pager('SiteCurrency');
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
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }        
    }
    
}    