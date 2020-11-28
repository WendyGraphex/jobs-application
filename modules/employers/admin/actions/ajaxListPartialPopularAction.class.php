<?php

require_once __DIR__."/../locales/FormFilters/EmployerAdvertPopularFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployerAdvertPopularPager.class.php";

class employers_ajaxListPartialPopularAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->formFilter= new EmployerAdvertPopularFormFilter($this->user);                  
        $this->pager=new EmployerAdvertPopularPager();
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
                  // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
                   $messages->addError(__('Filter has an errors.'));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);
     
    }
    
}
