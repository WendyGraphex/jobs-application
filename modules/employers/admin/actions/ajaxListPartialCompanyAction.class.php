<?php

require_once __DIR__."/../locales/FormFilters/EmployerCompanyFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployerCompanyPager.class.php";

class employers_ajaxListPartialCompanyAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->formFilter= new EmployerCompanyFormFilter($this->user);                  
        $this->pager=new EmployerCompanyPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                      //echo $this->formFilter->getQuery();
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                     
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
               }  
               //else
                   // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);
     
    }
    
}
