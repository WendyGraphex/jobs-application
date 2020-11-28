<?php

require_once __DIR__."/../locales/FormFilters/EmployerAdvertEmployerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployerAdvertEmployerPager.class.php";


class employers_listAdvertEmployerActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');      
         $this->formFilter= new EmployerAdvertEmployerFormFilter($this->getUser(),$request->getPostParameter('filter',$this->getParameter('options')));                                     
        $this->pager=new EmployerAdvertEmployerPager($this->getUser());
        try
        {              
            //echo $this->formFilter->getQuery();  die(__METHOD__);
            $this->pager->setQuery($this->formFilter->getQuery()); 
            $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                                                      
            $this->pager->setPage($request->getGetParameter('page'));
            $this->pager->setParameter('employer_user_id',$this->getParameter('employer_user')->get('id'));
            $this->pager->execute();                    
        }
        catch (mfException $e)
        {
            
        }                                    
    } 
    
    
}