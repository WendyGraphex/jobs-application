<?php

require_once __DIR__."/../locales/FormFilters/EmployeeAdvertBlockControllerFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeeAdvertBlockControllerPager.class.php";

class employees_ajaxListPartialBlockAdvertAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->formFilter= new EmployeeAdvertBlockControllerFormFilter($this->user);                  
        $this->pager=new EmployeeAdvertBlockControllerPager();
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
              //  echo mfSiteDatabase::getInstance()->getQuery();
               }
               else
               {
                   // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
                 // $messages->addError(__('Filter has an errors.'));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);
     
    }
    
}
