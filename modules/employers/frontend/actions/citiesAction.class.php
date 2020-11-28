<?php

// www.project55.net/employee/adverts

require_once __DIR__."/../locales/FormFilters/EmployerAdvertCitiesControllerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployerAdvertCitiesControllerPager.class.php";


class employers_citiesAction extends mfAction {
    
    
    function execute(mfWebRequest $request) { 
        $this->user=$this->getUser();
        $messages = mfMessages::getInstance();              
         $this->formFilter= new EmployerAdvertCitiesControllerFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployerAdvertCitiesControllerPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                  // echo $this->formFilter->getQuery();
                 //  echo $this->formFilter['nbitemsbypage'];
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                 //   $this->pager->setParameter('lang',$this->getUser()->getLanguage());                                     
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();    
                    
                 //   echo $this->pager->getCountQuery();
                    
             //   echo mfSiteDatabase::getInstance()->getQuery();
               }               
               else
               {
                 // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
                   $messages->addError(__("Filter has errors."));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        } 
     // echo "<pre>"; var_dump($this->pager->getItems()); die(__METHOD__);
    }
}
