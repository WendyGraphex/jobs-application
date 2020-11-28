<?php

require_once __DIR__."/../locales/FormFilters/CartProductForCartFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CartProductForCartPager.class.php";

class cart_ajaxListPartialProductForCartAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->cart=new Cart($request->getPostParameter('Cart'));
        if ($this->cart->isNotLoaded())
            return ;
        $this->formFilter= new CartProductForCartFormFilter(); 
        $this->pager=new CartProductForCartPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']); 
                $this->pager->setParameter('cart_id',$this->cart->get('id'));
                $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();         
                //echo mfSiteDatabase::getInstance()->getQuery();
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);     
    }
    
}

