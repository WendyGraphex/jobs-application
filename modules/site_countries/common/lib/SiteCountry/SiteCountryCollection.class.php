<?php

class SiteCountryCollection extends  mfObjectCollection3  {

  function hasCountry($code)
     {
         return (boolean)$this->getSelectedBy($code);
     }
    
     function getCountryByCode($code,$default=false)
     {
         if ($this->selected===null)
         {    
             $this->selected=$default;
            foreach ($this->collection as $item)
            {
                if ($item->get('code')==strtoupper($code))
                {    
                    $this->selected=$item;
                    return $this->selected;
                }
            }
         }
         return $this->selected;
     }
}


