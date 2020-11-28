<?php

require_once __DIR__."/../locales/FormFilters/EmployeeFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeePager.class.php";

class employees_ajaxListPartialEmployeeAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->formFilter= new EmployeeFormFilter($this->user);                  
        $this->pager=new EmployeePager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                  //  echo $this->formFilter->getQuery();
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                     
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();        
              //    echo mfSiteDatabase::getInstance()->getQuery();
               }     
 else {
   //  var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
 }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
         //   echo "Error";
        }    
       // var_dump($this->pager[0]);
     
    }
    
}