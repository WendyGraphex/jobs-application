<?php

// www.project55.net/employee/adverts

require_once __DIR__."/../locales/FormFilters/EmployerAdvertCountriesControllerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployerAdvertCountriesControllerPager.class.php";


class employers_countriesAction extends mfAction {
    
    
    function execute(mfWebRequest $request) { 
        $this->user=$this->getUser();
        $messages = mfMessages::getInstance();              
        $this->formFilter= new EmployerAdvertCountriesControllerFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployerAdvertCountriesControllerPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                  // echo $this->formFilter->getQuery();               
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                                              
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();                      
               }               
               else
               {             
                   $messages->addError(__("Filter has errors."));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }     
    }
}
