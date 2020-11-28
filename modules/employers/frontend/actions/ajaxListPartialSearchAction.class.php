<?php

require_once __DIR__."/../locales/FormFilters/EmployerAdvertSearchFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployerAdvertSearchPager.class.php";

class employers_ajaxListPartialSearchAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance();   
        $this->formFilter= new EmployerAdvertSearchFormFilter();                  
        $this->pager=new EmployerAdvertSearchPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
                $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setParameter('employer_user_id',$this->getUser()->getGuardUser()->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();   
              //  echo mfSiteDatabase::getInstance()->getQuery();
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }
    
   
}
