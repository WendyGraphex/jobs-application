<?php

class EmployerUserLanguageCollection extends mfObjectCollection3 {
             
     function toForm()
     {
         if ($this->values===null)
         {
             $this->values=new mfArray();
             foreach ($this as $item)
             {
                 $this->values[]=$item->toArray(array('lang','level_id'));
             }
         }   
         return $this->values;
     }
     
     
}

