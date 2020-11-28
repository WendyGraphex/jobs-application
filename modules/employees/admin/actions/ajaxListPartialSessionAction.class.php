<?php

require_once __DIR__."/../locales/FormFilters/EmployeeSessionFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeeSessionPager.class.php";

class employees_ajaxListPartialSessionAction extends mfAction {

    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();       
        try
        {                 
             $this->pager=new EmployeeSessionPager();    
               $this->formFilter= new EmployeeSessionFormFilter($this->user);                                 
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               { 
              //  echo $this->formFilter->getQuery()."<br/>";
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);  
                $this->pager->setParameter('lang',$this->getUser()->getLanguage());                    
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
               }                                            
        }
        catch (mfException $e)
        {
            $messages->addError($e);           
        }                
        //var_dump($this->pager);
    }
    
}    
