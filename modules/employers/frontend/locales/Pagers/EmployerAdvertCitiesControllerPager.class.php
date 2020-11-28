<?php

 
class EmployerAdvertCitiesControllerPager extends mfPager2 {
    
   function __construct() {                              
         parent::__construct("EmployerAdvertCityBundling");                    
    }
    
    function configure()
    {
        $this->items=new EmployerAdvertCityBundlingCollection();
        return $this;
    }
    
    
     protected function fetchObject($db)
    {              
      while ($item = $db->fetchObject($this->class)) 
      {                 
          $this->items[$item->country."_".$item->city]=$item;
      }
      $this->items->loadI18nAdverts($this);    
    }  
    
}