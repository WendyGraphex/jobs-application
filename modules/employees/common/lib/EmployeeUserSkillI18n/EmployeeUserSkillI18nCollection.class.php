<?php

class EmployeeUserSkillI18nCollection extends mfObjectCollection3 {
    
    
    
    function toArray()
    {
        if ($this->values===null)
        {
            $this->values=array();
            foreach ($this as $item)
               $this->values[]=$item->toArray(array('lang','value'));
        }
        return $this->values;
    }
     
}

