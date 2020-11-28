<?php

class SiteWarningI18nCollection extends mfObjectCollection3 {
    
   function create()
   {
       $position = SiteWarning::getLastPosition();       
       $collection = new SiteWarningCollection();
       foreach ($this as $item_i18n)
       {   
           $item=new SiteWarning();
           $item->set('position',++$position);
           $collection->push($item);       
       }
       $collection->save();
       foreach ($this as $idx=>$item)
       {
           $item->set('warning_id',$collection->getItemByKey($idx));
       }
       $this->save();
       return $this;
   }
}

