<?php

// www.project55.net/employee/adverts

require_once __DIR__."/../locales/FormFilters/EmployeeAdvertControllerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployeeAdvertControllerPager.class.php";


class employees_advertsAction extends mfAction {
    
    
    function execute(mfWebRequest $request) { 
        $this->user=$this->getUser();
        $messages = mfMessages::getInstance();
        $this->node=new EmployeeWorkCategory('root');
        $this->formFilter= new EmployeeAdvertControllerFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployeeAdvertControllerPager($this->getUser());
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                  // echo "<pre>"; echo $this->formFilter->getQuery();  echo "</pre>";
                 //  echo $this->formFilter['nbitemsbypage'];
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                 //   $this->pager->setParameter('lang',$this->getUser()->getLanguage());                                     
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();    
                    
                  //  echo $this->formFilter['nbitemsbypage'];
                    
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
       // var_dump($messages->getDecodedErrors());
    }
}
