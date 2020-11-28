<?php

// www.project55.net/employer/company/test

class employers_companyAction extends mfAction {
    
    function execute(mfWebRequest $request) {         
      $messages = mfMessages::getInstance();   
       $this->company=new EmployerCompany(array('url'=>new mfString($request->getRequestParameter('url')),'id'=>$request->getRequestParameter('id')),($this->getUser()->isAuthenticated() && $this->getUser()->isEmployerUser()?$this->getUser()->getGuardUser():null));              
   // echo "<pre>";  var_dump($this->company);die(__METHOD__);
       $this->forwardIf(($this->company->isNotLoaded()),$this->getModuleName(),'company404');
    
      // echo "<pre>"; var_dump($this->company->getContent()); die(__METHOD__);
        // If page exist
        $request->addRequestParameter('company', $this->company);              
        // @TODO Check if layout exists ???
      //  $this->getViewManager()->getLayoutManager(array("template"=>"/products/city_".$this->page->get('layout')))->compile();
        $this->getViewManager()->setTemplate("./employers_company_".$this->company->getContent()->get('template','default.tpl'));       
       /* $this->getResponse()->setTitle($this->company->getContent()->getI18n()->get('meta_title'));
       // $this->getResponse()->addMeta('title',$this->page_i18n->get('title'));
        $this->getResponse()->addMeta('description',$this->company->getContent()->getI18n()->get('meta_description'));
        $this->getResponse()->addMeta('keywords',$this->company->getContent()->getI18n()->get('meta_keywords'));*/
       // $this->getResponse()->addMeta('robots',$this->page->get('meta_robots'));
      //  $this->getResponse()->addMeta('author',$this->page->get('meta_author')); 
         $popular=new EmployerCompanyPopular(array('company'=>$this->company,'user'=>$this->getUser()));
         $popular->create();      
    }
}
