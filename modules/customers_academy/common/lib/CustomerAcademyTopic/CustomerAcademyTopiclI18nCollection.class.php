<?php

class CustomerAcademyTopicI18nCollection extends mfObjectCollection3 {
    
   function __construct($data) {
       if ($data instanceof CustomerCourseCategory)
       {
           $this->category=$data;           
           return parent::__construct();
       }
       parent::__construct($data);
   }
   
   function getCategory()
   {
       return $this->category;
   }
   
   function create()
   {
       $position = CustomerAcademyTopic::getLastPosition();       
       $collection = new CustomerAcademyTopicCollection();
       foreach ($this as $item_i18n)
       {   
           $item=new CustomerAcademyTopic();
           $item->add(array('position'=>++$position,'category_id'=>$this->getCategory()));
           $collection->push($item);       
       }
       $collection->save();
       foreach ($this as $idx=>$item)
       {
           $item->set('topic_id',$collection->getItemByKey($idx));
       }
       $this->save(); 
       return $this;
   }
}

