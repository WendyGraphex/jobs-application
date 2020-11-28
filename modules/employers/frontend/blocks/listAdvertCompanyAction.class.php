<?php

require_once __DIR__."/../locales/FormFilters/EmployerAdvertCompanyFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployerAdvertCompanyPager.class.php";


class employers_listAdvertCompanyActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');      
         $this->formFilter= new EmployerAdvertCompanyFormFilter($this->getUser(),$request->getPostParameter('filter',$this->getParameter('options')));                                     
        $this->pager=new EmployerAdvertCompanyPager($this->getUser());
        try
        {              
            //echo $this->formFilter->getQuery();  die(__METHOD__);
            $this->pager->setQuery($this->formFilter->getQuery()); 
            $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                                                      
            $this->pager->setPage($request->getGetParameter('page'));
            $this->pager->setParameter('company_id',$this->getParameter('company')->get('id'));
            $this->pager->execute();                    
        }
        catch (mfException $e)
        {
            
        }                                    
    } 
    
    
}