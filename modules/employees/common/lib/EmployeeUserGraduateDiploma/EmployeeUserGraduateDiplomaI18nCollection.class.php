<?php

class EmployeeUserGraduateDiplomaI18nCollection extends mfObjectCollection3 {
    
    
     function toArray()
    {
        if ($this->values===null)
        {
            $this->values=array();
            foreach ($this as $item)
               $this->values[]=$item->toArray(array('diploma','city','location'));
        }
        return $this->values;
    }
     
}

