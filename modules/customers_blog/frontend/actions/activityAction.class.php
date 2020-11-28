<?php

 // www.project55.net/activity/toto

class customers_blog_activityAction extends mfAction {
    
     
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();     
        $this->node_i18n=new CustomerBlogActivityI18n(array('url'=>new mfString($request->getRequestParameter('url')),'lang'=>$this->getUser()->getLanguage()));                
        $this->forwardIf($this->node_i18n->isNotLoaded(),$this->getModuleName(),'activity404');
         // If page exist
        $request->addRequestParameter('node_i18n', $this->node_i18n);              
        // @TODO Check if layout exists ???
      //  $this->getViewManager()->getLayoutManager(array("template"=>"/products/city_".$this->page->get('layout')))->compile();
        $this->getViewManager()->setTemplate("./customers_blog/activity_".$this->node_i18n->getActivity()->get('template','default.tpl'));       
        $this->getResponse()->setTitle($this->node_i18n->get('meta_title'));
       // $this->getResponse()->addMeta('title',$this->page_i18n->get('title'));
        $this->getResponse()->addMeta('description',$this->node_i18n->get('meta_description'));
        $this->getResponse()->addMeta('keywords',$this->node_i18n->get('meta_keywords'));
       // $this->getResponse()->addMeta('robots',$this->page->get('meta_robots'));
      //  $this->getResponse()->addMeta('author',$this->page->get('meta_author')); 
        // $popular=new EmployerWorkActivityPopular(array('activity'=>$this->node_i18n->getActivity(),'user'=>$this->getUser()));
        // $popular->create();        */
    }
}
