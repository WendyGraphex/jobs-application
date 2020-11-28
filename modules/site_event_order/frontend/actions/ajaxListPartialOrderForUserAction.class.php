<?php

require_once __DIR__."/../locales/FormFilters/SiteEventOrderForUserFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SiteEventOrderForUserPager.class.php";

class site_event_order_ajaxListPartialOrderForUserAction extends mfAction {
 
   
   function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isEventUser())          
                $this->forwardTo401Action();
         $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();           
        $this->formFilter= new SiteEventOrderForUserFormFilter();                  
        $this->pager=new SiteEventOrderForUserPager();        
        if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
        {    
            $this->pager->setQuery($this->formFilter->getQuery()); 
            $this->pager->setNbItemsByPage(10);   
            $this->pager->setParameter('event_user_id',$this->getUser()->getGuardUser()->get('id'));
            $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                     
            $this->pager->setPage($request->getGetParameter('page'));
            $this->pager->execute();           
           // echo mfSiteDatabase::getInstance()->getQuery();
        }   
    }
    
}
