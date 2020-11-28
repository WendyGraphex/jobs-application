<?php

class SiteHelpI18nCollection extends mfObjectCollection3 {
    
   function create()
   {
       $position = SiteHelp::getLastPosition();       
       $collection = new SiteHelpCollection();
       foreach ($this as $item_i18n)
       {   
           $item=new SiteHelp();
           $item->set('position',++$position);
           $collection->push($item);       
       }
       $collection->save();
       foreach ($this as $idx=>$item)
       {
           $item->set('help_id',$collection->getItemByKey($idx));
       }
       $this->save();
       return $this;
   }
}

