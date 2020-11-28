<?php

// www.project55.net/employer/advert/test.html

class employers_advertAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
      $this->advert_i18n=new EmployerAdvertI18n($request->getRequestParameters(array('url','lang','id')));    
       $this->forwardIf(($this->advert_i18n->isNotLoaded()),$this->getModuleName(),'advert404');
          // If page exist
         $request->addRequestParameter('advert_i18n', $this->advert_i18n);              
//        // @TODO Check if layout exists ???
//      //  $this->getViewManager()->getLayoutManager(array("template"=>"/products/city_".$this->page->get('layout')))->compile();
//        $this->getViewManager()->setTemplate("./products_product_".$this->product_i18n->getProduct()->get('template','default.tpl'));       
         $this->getResponse()->setTitle($this->advert_i18n->get('title'));
        // $this->getResponse()->addMeta('title',$this->page_i18n->get('title'));
         $this->getResponse()->addMeta('description',$this->advert_i18n->get('short_description'));
//        $this->getResponse()->addMeta('keywords',$this->product_i18n->get('meta_keywords'));
//       // $this->getResponse()->addMeta('robots',$this->page->get('meta_robots'));
//      //  $this->getResponse()->addMeta('author',$this->page->get('meta_author'));         
         $popular=new EmployerAdvertPopular(array('advert'=>$this->advert_i18n->getAdvert(),'user'=>$this->getUser()));
         $popular->create();  
    }
}
