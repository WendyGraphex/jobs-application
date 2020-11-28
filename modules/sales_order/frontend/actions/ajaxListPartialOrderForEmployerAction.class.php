<?php

require_once __DIR__."/../locales/FormFilters/SaleOrderForEmployerFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SaleOrderForEmployerPager.class.php";


class sales_order_ajaxListPartialOrderForEmployerAction extends mfAction {
 
   
   function execute(mfWebRequest $request) {
        if ($this->getUser()->isAuthenticated() && !$this->getUser()->isEmployerUser())          
                $this->forwardTo401Action();
         $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();           
        $this->formFilter= new SaleOrderForEmployerFormFilter();                  
        $this->pager=new SaleOrderForEmployerPager();        
        if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
        {    
            $this->pager->setQuery($this->formFilter->getQuery()); 
            $this->pager->setNbItemsByPage(10);   
            $this->pager->setParameter('employer_user_id',$this->getUser()->getGuardUser()->get('id'));
            $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                     
            $this->pager->setPage($request->getGetParameter('page'));
            $this->pager->execute();           
           // echo mfSiteDatabase::getInstance()->getQuery();
        }   
    }
    
}
