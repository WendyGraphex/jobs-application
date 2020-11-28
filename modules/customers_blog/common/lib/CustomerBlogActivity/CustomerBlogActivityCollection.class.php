<?php

class CustomerBlogActivityCollection extends  mfObjectCollection3 {
    
       
   /* function toArray(){
        $values=array();
        foreach($this as $item)
            $values[]=$item->toArray(array('id','reference'));
        return $values;
    }*/
    
     function getActivities()
     {         
         if ($this->activities===null)
         {    
            $this->activities=new mfArray();
            if ($this->isEmpty())
               return $this->activities;
            foreach ($this as $activity)
            {
               $this->activities[$activity->get('id')]=$activity; 
            }              
         }
         return $this->activities;
     }
     
      function getPath()
     {
         if ($this->path===null)
         {    
            $this->path=new mfArray();
            if ($this->isEmpty())
               return $this->path;
            foreach ($this as $activity)
            {
               $this->path[]=$activity->get('name'); 
            }              
         }
         return $this->path;
     }
     
     function getPathI18n()
     {
         if ($this->path_i18n===null)
         {    
            $this->path_i18n=new mfArray();
            if ($this->isEmpty())
               return $this->path_i18n;
            foreach ($this as $activity)
            {
               $this->path_i18n[]=$activity->hasI18n()?(string)$activity->getI18n():$activity->get('name'); 
            }              
         }
         return $this->path_i18n; 
     }
     
     
     function getUrlPathI18n()
     {
         if ($this->url_path_i18n===null)
         {    
            $this->url_path_i18n=new mfArray();
            if ($this->isEmpty())
               return $this->url_path_i18n;
            foreach ($this as $activity)
            {
               $this->url_path_i18n[]=$activity->hasI18n()?$activity->getI18n()->get('url'):$activity->get('name'); 
            }              
         }
         return $this->url_path_i18n; 
     }
    
   
     
      function toSelect()
     {
         if ($this->toselect===null)
         {
             $this->toselect=new mfArray();
             foreach ($this as $item)
             {
               $this->toselect[$item->get('id')]=(string)$item->getI18n()->getFormatter()->getTitle()->ucfirst();
             }    
         }
         return $this->toselect;
     } 
}

