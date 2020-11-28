<?php

require_once dirname(__FILE__)."/../locales/FormFilters/SmsBoxSentFormFilter.class.php";
require_once dirname(__FILE__)."/../locales/Pagers/SmsBoxSentPager.class.php";

class services_smsbox_ajaxListPartialAction extends mfAction {


    function execute(mfWebRequest $request) {                
        $messages = mfMessages::getInstance();                                    
        try
        {
             $this->formFilter = new SmsBoxSentFormFilter();
             $this->pager = new SmsBoxSentPager();
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

