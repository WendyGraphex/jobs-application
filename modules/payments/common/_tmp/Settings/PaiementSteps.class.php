<?php

class paymentSteps extends OrderedSteps  {
         
     const stepClass="paymentStep";
    
     function getStepFromRoute($route_to_find)
     {         
         foreach ($this->steps as $step)
         {    
            $routes= $step->get('routes');            
            foreach ($routes as $route=>$parameters)
            {                        
                if ($route == $route_to_find->getName())
                {                        
                    if ($parameters == $route_to_find->getMatches())
                        return $step;
                }    
            }   
            //  if (in_array($route,(array)$step->get('routes')))
            //      return $step;               
         }
         return null;
     }    
     
}

