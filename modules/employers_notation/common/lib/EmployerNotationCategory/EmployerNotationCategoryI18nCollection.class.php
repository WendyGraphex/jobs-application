<?php

class EmployerNotationCategoryI18nCollection extends mfObjectCollection3 {
    
   function create()
   {
       $position = EmployerNotationCategory::getLastPosition();       
       $collection = new EmployerNotationCategoryCollection();
       foreach ($this as $item_i18n)
       {   
           $item=new EmployerNotationCategory();
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

