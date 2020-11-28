<?php

 // www.project55.net/employer/card/frederic_mallet.html

class employers_employerAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();  
     
       
       $this->employer_user=new EmployerUser(array('url'=>$request->getRequestParameter('url')),($this->getUser()->isEmployerUser()?$this->getUser()->getGuardUser():null));              
       $this->forwardIf(($this->employer_user->isNotLoaded()),$this->getModuleName(),'employer404');      
        $request->addRequestParameter('employer_user', $this->employer_user);              
        // @TODO Check if layout exists ???
      //  $this->getViewManager()->getLayoutManager(array("template"=>"/products/city_".$this->page->get('layout')))->compile();
        $this->getViewManager()->setTemplate("./employers_user_".$this->employer_user->getContent()->get('template','default.tpl'));       
        $this->getResponse()->setTitle($this->employer_user->getContent()->getI18n()->get('meta_title'));
       // $this->getResponse()->addMeta('title',$this->page_i18n->get('title'));
        $this->getResponse()->addMeta('description',$this->employer_user->getContent()->getI18n()->get('meta_description'));
        $this->getResponse()->addMeta('keywords',$this->employer_user->getContent()->getI18n()->get('meta_keywords'));
       // $this->getResponse()->addMeta('robots',$this->page->get('meta_robots'));
      //  $this->getResponse()->addMeta('author',$this->page->get('meta_author')); 
         $popular=new EmployerUserPopular(array('employer'=>$this->employer_user,'user'=>$this->getUser()));
        $popular->create();  
    }
}
