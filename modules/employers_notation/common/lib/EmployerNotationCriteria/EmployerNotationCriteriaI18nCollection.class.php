<?php

class EmployerNotationCriteriaI18nCollection extends mfObjectCollection3 {
        
   function create($category,$max)
   {
       $position = EmployerNotationCriteria::getLastPosition();       
       $collection = new EmployerNotationCriteriaCollection();
       foreach ($this as $item_i18n)
       {   
           $item=new EmployerNotationCriteria();
           $item->set('position',++$position);
           $item->set('category_id',$category);
           $item->set('max',$max);
           $collection->push($item);       
       }
       $collection->save();
       foreach ($this as $idx=>$item)
       {
           $item->set('criteria_id',$collection->getItemByKey($idx));
       }
       $this->save();
       return $this;
   }
}

