<?php

require_once dirname(__FILE__)."/../locales/FormFilters/EmailerSpoolerFormFilter.class.php";
require_once dirname(__FILE__)."/../locales/Pagers/EmailerSpoolerPager.class.php";

class emailer_spooler_ajaxListPartialEmailAction extends mfAction {


   
        
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new EmailerSpoolerFormFilter();                  
        $this->pager=new EmailerSpoolerPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                                             
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->executeSuperAdmin();              
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
       // var_dump($this->pager[0]);
    }
    
}    