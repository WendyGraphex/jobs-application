<?php

require_once dirname(__FILE__)."/../locales/FormFilters/EmailerSpoolerFormFilter.class.php";
require_once dirname(__FILE__)."/../locales/Pagers/EmailerSpoolerPager.class.php";

class emailer_spooler_ajaxListPartialEmailAction extends mfAction {

 
        
    function execute(mfWebRequest $request) {
       // if (!$this->getUser()->hasCredential(array(array('superadmin','emailer_spooler'))))
       //       $this->forwardTo401Action();
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
                $this->pager->setParameter('site_id',$request->getSite()->getSite()->get('site_id'));  
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