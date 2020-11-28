<?php

class EmployerAdvertSearchBase extends CustomerAdvertSearch {
     
       
    function getCategory()
    {
       return $this->_category_id=$this->_category_id===null?new  EmployerWorkCategory($this->get('category_id')):$this->_category_id;                 
    } 
    
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployerAdvertSearchFormatter($this):$this->formatter;
   }      
  
    function create()
    {
       $this->setUser(mfCOntext::getInstance()->getUser()->isAuthenticated()?mfCOntext::getInstance()->getUser()->getGuardUser():null); 
       $this->set('ip',mfCOntext::getInstance()->getRequest()->getIP());
       $this->set('lang',mfCOntext::getInstance()->getRequest()->getLanguage());
       $this->set('culture',mfCOntext::getInstance()->getRequest()->getCulture());
        $this->set('type','employer');
       return $this->save();
    }
}