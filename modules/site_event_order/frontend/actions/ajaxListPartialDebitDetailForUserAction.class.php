<?php

require_once __DIR__."/../locales/FormFilters/SiteEventDebitDetailForUserFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SiteEventDebitDetailForUserPager.class.php";


class site_event_order_ajaxListPartialDebitDetailForUserAction extends mfAction {
 
   
   function execute(mfWebRequest $request) {
        if (!$this->getUser()->isEventUser())          
                $this->forwardTo401Action();
         $messages = mfMessages::getInstance();     
        $this->order=new SiteEventOrder($request->getPostParameter('SiteEventOrder'),$this->getUser()->getGuardUser());
        if ($this->order->isNotLoaded())
            return ;
        $this->user=$this->getUser();           
        $this->formFilter= new SiteEventDebitDetailForUserFormFilter();                  
        $this->pager=new SiteEventDebitDetailForUserPager();        
        if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
        {    
            $this->pager->setQuery($this->formFilter->getQuery()); 
            $this->pager->setNbItemsByPage(10);   
            $this->pager->setParameter('event_user_id',$this->getUser()->getGuardUser()->get('id'));
            $this->pager->setParameter('order_id',$this->order->get('id'));
            $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                     
            $this->pager->setPage($request->getGetParameter('page'));
            $this->pager->execute();           
           // echo mfSiteDatabase::getInstance()->getQuery();
        }   
    }
    
}
