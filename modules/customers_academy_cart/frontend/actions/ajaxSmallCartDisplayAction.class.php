<?php

require_once __DIR__."/../locales/FormFilters/CustomerAcademySmallCartFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CustomerAcademySmallCartPager.class.php";

class customers_academy_cart_ajaxSmallCartDisplayAction extends mfAction {
    
   function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->cart=$this->getUser()->getStorage()->read('academy_cart');
        if ($this->cart===null)
            return ;
        $this->formFilter= new CustomerAcademySmallCartFormFilter();                  
        $this->pager=new CustomerAcademySmallCartPager();
        if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
        {    
            $this->pager->setQuery($this->formFilter->getQuery()); 
            $this->pager->setNbItemsByPage(10);   
            $this->pager->setParameter('cart_id',$this->cart->get('id'));
            $this->pager->setParameter('lang',$this->getUser()->getLanguage());
            $this->pager->setPage(1);
            $this->pager->execute();              
        }  
       // echo mfSiteDatabase::getInstance()->getQuery();
       // var_dump($this->pager[68]->getQuotation()->get('id'));
    }
    
}

