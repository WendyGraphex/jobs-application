<?php

class EmployeeAdvertSearchBase extends CustomerAdvertSearch {
     
       
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeAdvertSearchFormatter($this):$this->formatter;
   }
   
    function getCategory()
    {
       return $this->_category_id=$this->_category_id===null?new  EmployeeWorkCategory($this->get('category_id')):$this->_category_id;                 
    } 
    
   
    function create()
    {
       $this->setUser(mfCOntext::getInstance()->getUser()->isAuthenticated()?mfCOntext::getInstance()->getUser()->getGuardUser():null); 
       $this->set('ip',mfCOntext::getInstance()->getRequest()->getIP());
       $this->set('lang',mfCOntext::getInstance()->getRequest()->getLanguage());
       $this->set('culture',mfCOntext::getInstance()->getRequest()->getCulture());
       $this->set('type','employee');
       return $this->save();
    }
    
    
    
    
      
}