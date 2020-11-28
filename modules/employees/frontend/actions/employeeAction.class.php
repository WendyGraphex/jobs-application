<?php

 // www.project55.net/employee/card/frederic_mallet.html

class employees_employeeAction extends mfAction {
    
     function preExecute() {
    //    $this->getResponse()->addJavascript('ui/i18n/jquery.ui.datepicker-'.str_replace('_','-',$this->getUser()->getCulture()).'.js');       
    }
    
    function execute(mfWebRequest $request) {   
       $messages = mfMessages::getInstance();          
       $this->employee_user=new Employee(array('url'=>$request->getRequestParameter('url')),($this->getUser()->isAuthenticated() && $this->getUser()->isEmployee()?$this->getUser()->getGuardUser():null));                    
       $this->forwardIf(($this->employee_user->isNotLoaded()),$this->getModuleName(),'employee404');
       
      
     /*  echo "<pre>"; 
       foreach ($this->employee_user->getUserDiplomas() as $user_diploma)
       {    
            var_dump($user_diploma->getI18n()->getFormatter()->getCity()); 
       }
       die(__METHOD__);   */
       $request->addRequestParameter('employee_user', $this->employee_user);              
     // echo "<pre>"; var_dump($this->employee_user->getContent()->getI18n());die(__METHOD__);
      //  $this->getViewManager()->getLayoutManager(array("template"=>"/products/city_".$this->page->get('layout')))->compile();
         $this->getViewManager()->setTemplate("./employees_user_".$this->employee_user->getContent()->get('template','default.tpl'));       
    /*    $this->getResponse()->setTitle($this->employee_user->getContent()->getI18n()->get('meta_title'));
       // $this->getResponse()->addMeta('title',$this->page_i18n->get('title'));
        $this->getResponse()->addMeta('description',$this->employee_user->getContent()->getI18n()->get('meta_description'));
        $this->getResponse()->addMeta('keywords',$this->employee_user->getContent()->getI18n()->get('meta_keywords'));*/
        $popular=new EmployeeUserPopular(array('employee'=>$this->employee_user,'user'=>$this->getUser()));
        $popular->create();    
    
        //var_dump($this->category_i18n->getCategory()->getPathI18n());*/
    }
}
