<?php

class EmployerCityGalleryCityCollection extends  mfObjectCollection3 {
    
       
    function getCities()
    {
          if ($this->cities===null)
        {
            $this->cities= new EmployerCityCollection();
            foreach ($this as $item)
            {
               $this->cities[$item->getCity()->get('id')]=$item->getCity();
            }    
        }   
        return $this->cities;
    }
   
}

