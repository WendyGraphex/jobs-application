<?php

 
class EmployeeAdvertCountriesControllerPager extends mfPager {
    
   
    function __construct($filter) {                       
         $this->filter=$filter;
         parent::__construct("EmployeeAdvertCountryBundling");                    
    }
    
    function configure()
    {
        $this->items=new EmployeeAdvertCountryBundlingCollection();
        return $this;
    }
    
    
     protected function fetchObject($db)
    {              
      while ($item = $db->fetchObject($this->class)) 
      {           
          $this->items[$item->country]=$item;
      }
      $this->items->loadI18nAdverts($this->filter);    
    }
      
    
}