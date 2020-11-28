<?php

class CustomerCourseCategoryI18nCollection extends  mfObjectCollection3 {
    
       
   /* function toArray(){
        $values=array();
        foreach($this as $item)
            $values[]=$item->toArray(array('id','reference'));
        return $values;
    }*/
    
    /* function getCategories()
     {         
         if ($this->categories===null)
         {    
            $this->categories=new mfArray();
            if ($this->isEmpty())
               return $this->categories;
            foreach ($this as $category)
            {
               $this->categories[$category->get('id')]=$category; 
            }              
         }
         return $this->categories;
     }
     
      function getPath()
     {
         if ($this->path===null)
         {    
            $this->path=new mfArray();
            if ($this->isEmpty())
               return $this->path;
            foreach ($this as $category)
            {
               $this->path[]=$category->get('name'); 
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
            foreach ($this as $category)
            {
               $this->path_i18n[]=$category->hasI18n()?(string)$category->getI18n():$category->get('name'); 
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
            foreach ($this as $category)
            {
               $this->url_path_i18n[]=$category->hasI18n()?$category->getI18n()->get('url'):$category->get('name'); 
            }              
         }
         return $this->url_path_i18n; 
     }
    */
   
}

