<?php

 
require_once __DIR__."/../locales/FormFilters/EmployeeControllerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployeeControllerPager.class.php";

class employees_employeesActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                            
        $messages = mfMessages::getInstance(); 
       $messages = mfMessages::getInstance();          
        $this->formFilter= new EmployeeControllerFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployeeControllerPager();
        try
        {              
                 //    echo $this->formFilter->getQuery();
            $this->pager->setQuery($this->formFilter->getQuery()); 
            $this->pager->setNbItemsByPage($$this->formFilter['nbitemsbypage']);   
            $this->pager->setParameter('lang',$this->getUser()->getLanguage());                    
            $this->pager->setParameter('level',1);
            $this->pager->setPage($request->getGetParameter('page'));
            $this->pager->execute();                  
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }     
        $this->tpl=$this->getParameter('tpl','default');      
    } 
    
    
}