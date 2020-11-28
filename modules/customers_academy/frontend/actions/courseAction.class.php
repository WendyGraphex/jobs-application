<?php

// http://www.project55.net/academy/course/en-zzz-25.html

class customers_academy_courseAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
       $this->course_i18n=new CustomerAcademyCourseI18n($request->getRequestParameters(array('url','lang','id')));        
       $this->forwardIf($this->course_i18n->isNotLoaded(),$this->getModuleName(),'course404');
//         // If page exist
        $request->addRequestParameter('course_i18n', $this->course_i18n);              
        // @TODO Check if layout exists ???
      //  $this->getViewManager()->getLayoutManager(array("template"=>"/products/city_".$this->page->get('layout')))->compile();
        $this->getViewManager()->setTemplate("./customers_academy_".$this->course_i18n->get('template','default.tpl'));       
        $this->getResponse()->setTitle($this->course_i18n->get('title'));
       // $this->getResponse()->addMeta('title',$this->page_i18n->get('title'));
        $this->getResponse()->addMeta('description',$this->course_i18n->get('meta_description'));
        $this->getResponse()->addMeta('keywords',$this->course_i18n->get('meta_keywords'));
//       // $this->getResponse()->addMeta('robots',$this->page->get('meta_robots'));
//      //  $this->getResponse()->addMeta('author',$this->page->get('meta_author')); */
         $popular=new CustomerAcademyCoursePopular(array('course'=>$this->course_i18n,'user'=>$this->getUser()));
         $popular->create();      
    }
}
