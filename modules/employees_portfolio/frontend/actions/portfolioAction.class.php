<?php

// www.project55.net/employee/portfolio/employee3

class employees_portfolio_portfolioAction extends mfAction {
    
    function execute(mfWebRequest $request) {                    
      $messages = mfMessages::getInstance();   
       $this->employee_user=new Employee(array('url'=>$request->getRequestParameter('url')),($this->getUser()->isAuthenticated() && $this->getUser()->isEmployee()?$this->getUser()->getGuardUser():null));                    
       $this->forwardIf(($this->employee_user->isNotLoaded()),$this->getModuleName(),'portofolio404');
       
 // $this->project=new EmployerAdvertI18n(array('url'=>$request->getRequestParameter('url'),'lang'=>$this->getUser()->getLanguage()));              
    //  $this->forwardIf( !$this->portfolio,$this->getModuleName(),'portfolio404');
//         // If page exist
//        $request->addRequestParameter('product_i18n', $this->product_i18n);              
//        // @TODO Check if layout exists ???
//      //  $this->getViewManager()->getLayoutManager(array("template"=>"/products/city_".$this->page->get('layout')))->compile();
//        $this->getViewManager()->setTemplate("./products_product_".$this->product_i18n->getProduct()->get('template','default.tpl'));       
//        $this->getResponse()->setTitle($this->product_i18n->get('title'));
//       // $this->getResponse()->addMeta('title',$this->page_i18n->get('title'));
//        $this->getResponse()->addMeta('description',$this->product_i18n->get('meta_description'));
//        $this->getResponse()->addMeta('keywords',$this->product_i18n->get('meta_keywords'));
//       // $this->getResponse()->addMeta('robots',$this->page->get('meta_robots'));
//      //  $this->getResponse()->addMeta('author',$this->page->get('meta_author')); 
//        $popular=new ProductPopular(array('product'=>$this->product_i18n->getProduct(),'user'=>$this->getUser()));
//        $popular->create();      
    //    $popular=new EmployerAdvertPopular(array('advert'=>$this->advert_i18n->getAdvert(),'user'=>$this->getUser()));
     //    $popular->create();  
    }
}
