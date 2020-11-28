<?php

class EmployeeNotationCriteriaI18nCollection extends mfObjectCollection3 {
    
   function create($category,$max)
   {
       $position = EmployeeNotationCriteria::getLastPosition();       
       $collection = new EmployeeNotationCriteriaCollection();
       foreach ($this as $item_i18n)
       {   
           $item=new EmployeeNotationCriteria();
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

