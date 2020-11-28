<?php

require_once __DIR__."/../locales/FormFilters/EmployeeWorkFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeeWorkPager.class.php";

class employees_work_ajaxListPartialWorkAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new EmployeeWorkFormFilter();                  
        $this->pager=new EmployeeWorkPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);        
                $this->pager->setParameter('employee_user_id',$this->getUser()->getGuardUser()->get('id'));
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