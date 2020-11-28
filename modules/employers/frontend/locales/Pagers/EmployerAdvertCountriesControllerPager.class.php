<?php

 
class EmployerAdvertCountriesControllerPager extends mfPager2 {
    
    function __construct() {                              
         parent::__construct("EmployerAdvertCountryBundling");                    
    }
    
    function configure()
    {
        $this->items=new EmployerAdvertCountryBundlingCollection();
        return $this;
    }
    
    
     protected function fetchObject($db)
    {              
      while ($item = $db->fetchObject($this->class)) 
      {           
          $this->items[$item->country]=$item;
      }
      $this->items->loadI18nAdverts($this->getQuery());    
    }
    
}