<?php

require_once __DIR__."/../locales/FormFilters/EmployeeAdvertEmployeeFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployeeAdvertEmployeePager.class.php";


class employees_listAdvertEmployeeActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');      
         $this->formFilter= new EmployeeAdvertEmployeeFormFilter($this->getUser(),$request->getPostParameter('filter',$this->getParameter('options')));                                     
        $this->pager=new EmployeeAdvertEmployeePager($this->getUser());
        try
        {              
            //echo $this->formFilter->getQuery();  die(__METHOD__);
            $this->pager->setQuery($this->formFilter->getQuery()); 
            $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                                                      
            $this->pager->setPage($request->getGetParameter('page'));
            $this->pager->setParameter('employee_user_id',$this->getParameter('employee_user')->get('id'));
            $this->pager->execute();                    
        }
        catch (mfException $e)
        {
            
        }                                    
    } 
    
    
}