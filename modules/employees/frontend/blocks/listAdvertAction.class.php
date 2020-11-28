<?php

require_once __DIR__."/../locales/FormFilters/EmployeeAdvertBlockControllerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployeeAdvertBlockControllerPager.class.php";


class employees_listAdvertActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');      
        $this->formFilter= new EmployeeAdvertBlockControllerFormFilter($this->getUser(),$request->getPostParameter('filter',$this->getParameter('options')));                                     
        $this->pager=new EmployeeAdvertBlockControllerPager();
        try
        {              
            //echo $this->formFilter->getQuery();  die(__METHOD__);
            $this->pager->setQuery($this->formFilter->getQuery()); 
            $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                                                      
            $this->pager->setPage($request->getGetParameter('page'));
            $this->pager->execute();                    
        }
        catch (mfException $e)
        {
            
        }          
    } 
    
    
}