<?php

require_once dirname(__FILE__)."/../locales/FormFilters/EmailerSpoolerSchedulerFormFilter.class.php";
require_once dirname(__FILE__)."/../locales/Pagers/EmailerSpoolerSchedulerPager.class.php";

class emailer_spooler_ajaxListPartialSchedulerAction extends mfAction {


 
        
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new EmailerSpoolerSchedulerFormFilter();                  
        $this->pager=new EmailerSpoolerSchedulerPager();
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
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }         
       // var_dump($this->pager[0]);
    }
    
}    