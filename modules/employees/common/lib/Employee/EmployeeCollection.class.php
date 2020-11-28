<?php

class EmployeeCollection extends mfObjectCollection3 {
    
    
    function toArrayForSelect()
    {
        $values=new mfArray(array(array('id'=>'','name'=>'')));
        foreach ($this->collection as $item)
           $values[]=$item->toArrayForSelect();
        return $values;
    }
   
}

