<?php

require_once __DIR__."/../locales/FormFilters/MyCartFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/MyCartPager.class.php";

class cart_ajaxMyCartAction extends mfAction {
 
   /*  function preExecute() {
        $this->getResponse()->addJavascript('ui/i18n/jquery.ui.datepicker-'.str_replace('_','-',$this->getUser()->getCulture()).'.js');       
     }*/
     
   function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->cart=$this->getUser()->getStorage()->read('cart');
        if ($this->cart===null)
            return ;        
        $this->formFilter= new MyCartFormFilter();                  
        $this->pager=new MyCartPager();
        
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
