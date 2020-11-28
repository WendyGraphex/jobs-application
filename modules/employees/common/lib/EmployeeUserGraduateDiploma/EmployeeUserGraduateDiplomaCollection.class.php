<?php

class EmployeeUserGraduateDiplomaCollection extends mfObjectCollection3 {
    
   
     function toForm()
     {
         if ($this->values===null)
         {
             $this->values=new mfArray();
             foreach ($this as $item)
             {
                 $this->values[]=$item->toArray();
             }
         }   
         return $this->values;
     }
}

