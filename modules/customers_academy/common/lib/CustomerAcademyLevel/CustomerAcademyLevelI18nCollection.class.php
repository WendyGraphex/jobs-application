<?php

class CustomerAcademyLevelI18nCollection extends mfObjectCollection3 {
    
   function create()
   {
       $position = CustomerAcademyLevel::getLastPosition();       
       $collection = new CustomerAcademyLevelCollection();
       foreach ($this as $item_i18n)
       {   
           $item=new CustomerAcademyLevel();
           $item->set('position',++$position);
           $collection->push($item);       
       }
       $collection->save();
       foreach ($this as $idx=>$item)
       {
           $item->set('level_id',$collection->getItemByKey($idx));
       }
       $this->save();
       return $this;
   }
}

