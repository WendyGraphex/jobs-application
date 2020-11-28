<?php

class EmployeeSkillI18nCollection extends mfObjectCollection3 {
    
   function create()
   {
       $position = EmployeeSkill::getLastPosition();       
       $collection = new EmployeeSkillCollection();
       foreach ($this as $item_i18n)
       {   
           $item=new EmployeeSkill();
           $item->set('position',++$position);
           $collection->push($item);       
       }
       $collection->save();
       foreach ($this as $idx=>$item)
       {
           $item->set('skill_id',$collection->getItemByKey($idx));
       }
       $this->save();
       return $this;
   }
}

