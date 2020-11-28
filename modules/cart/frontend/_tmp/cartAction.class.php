<?php

require_once __DIR__."/../locales/FormFilters/CartFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CartPager.class.php";
require_once __DIR__."/../locales/Forms/CartEventCreateForm.class.php";
require_once __DIR__."/../locales/Forms/CartSigninForm.class.php";
class cart_cartAction extends mfAction {  
    
     function preExecute() {
        $this->getResponse()->addJavascript('ui/i18n/jquery.ui.datepicker-'.str_replace('_','-',$this->getUser()->getCulture()).'.js');       
     }
     
    function execute(mfWebRequest $request) {             
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();        
        $this->cart=$this->getUser()->getStorage()->read('cart');
        if ($this->cart===null)
            return ;
         $this->SigninForm=new CartSigninForm();
         $this->form = new CartEventCreateForm();
         $this->cart->getEvent()->add($this->form->getDefaults());
        $this->formFilter= new CartFormFilter();                  
        $this->pager=new CartPager();
        if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
        {    
            $this->pager->setQuery($this->formFilter->getQuery()); 
            $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
            $this->pager->setParameter('cart_id',$this->cart->get('id'));
            $this->pager->setParameter('lang',$this->getUser()->getLanguage());
            $this->pager->setPage($request->getGetParameter('page'));
            $this->pager->execute();              
        }  
        
      // var_dump($this->cart->getEngine()->getTaxes());
    }
       
}


