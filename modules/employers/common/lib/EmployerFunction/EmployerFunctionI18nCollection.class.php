<?php

class EmployerFunctionI18nCollection extends mfObjectCollection3 {
    
   function create()
   {
       $position = EmployerFunction::getLastPosition();       
       $collection = new EmployerFunctionCollection();
       foreach ($this as $item_i18n)
       {   
           $item=new EmployerFunction();
           $item->set('position',++$position);
           $collection->push($item);       
       }
       $collection->save();
       foreach ($this as $idx=>$item)
       {
           $item->set('function_id',$collection->getItemByKey($idx));
       }
       $this->save();
       return $this;
   }
}

