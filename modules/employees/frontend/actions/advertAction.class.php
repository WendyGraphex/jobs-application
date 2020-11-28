<?php

// www.project55.net/employee/advert/test.html

class employees_advertAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();          
      $this->advert_i18n=new EmployeeAdvertI18n($request->getRequestParameters(array('url','lang','id')));         
      $this->forwardIf($this->advert_i18n->isNotLoaded(),$this->getModuleName(),'advert404');
      $request->addRequestParameter('advert_i18n', $this->advert_i18n);              
//        // @TODO Check if layout exists ???
//      //  $this->getViewManager()->getLayoutManager(array("template"=>"/products/city_".$this->page->get('layout')))->compile();
//        $this->getViewManager()->setTemplate("./products_product_".$this->product_i18n->getProduct()->get('template','default.tpl'));       
//        $this->getResponse()->setTitle($this->product_i18n->get('title'));
//       // $this->getResponse()->addMeta('title',$this->page_i18n->get('title'));
//        $this->getResponse()->addMeta('description',$this->product_i18n->get('meta_description'));
//        $this->getResponse()->addMeta('keywords',$this->product_i18n->get('meta_keywords'));
//       // $this->getResponse()->addMeta('robots',$this->page->get('meta_robots'));
//      //  $this->getResponse()->addMeta('author',$this->page->get('meta_author')); 
         $popular=new EmployeeAdvertPopular(array('advert'=>$this->advert_i18n->getAdvert(),'user'=>$this->getUser()));
         $popular->create();      
    }
}
