<?php

class EmployeeNotationCategoryI18nCollection extends mfObjectCollection3 {
    
   function create()
   {
       $position = EmployeeNotationCategory::getLastPosition();       
       $collection = new EmployeeNotationCategoryCollection();
       foreach ($this as $item_i18n)
       {   
           $item=new EmployeeNotationCategory();
           $item->set('position',++$position);
           $collection->push($item);       
       }
       $collection->save();
       foreach ($this as $idx=>$item)
       {
           $item->set('category_id',$collection->getItemByKey($idx));
       }
       $this->save();
       return $this;
   }
}

