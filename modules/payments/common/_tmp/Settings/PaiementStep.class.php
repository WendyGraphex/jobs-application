<?php

class paymentStep extends step  {       
  
 
      function getRoute()
      {
          reset($this->routes);
          return key($this->routes);          
      }
      
      function getRouteParameters()
      {
           reset($this->routes);
           return current($this->routes);
      }
      
      
}

