<?php

require_once __DIR__."/../locales/FormFilters/SiteEventMyCartFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SiteEventMyCartPager.class.php";

class site_event_cart_ajaxMyCartAction extends mfAction {
 

   function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->cart=$this->getUser()->getStorage()->read('event_cart');
        if ($this->cart===null)
            return ;        
        $this->formFilter= new SiteEventMyCartFormFilter();                  
        $this->pager=new SiteEventMyCartPager();
        
        if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
        {    
            $this->pager->setQuery($this->formFilter->getQuery()); 
            $this->pager->setNbItemsByPage(10);   
            $this->pager->setParameter('cart_id',$this->cart->get('id'));
            $this->pager->setParameter('lang',$this->getUser()->getLanguage());
            $this->pager->setPage(1);
            $this->pager->execute();              
        }   
    }
    
}
