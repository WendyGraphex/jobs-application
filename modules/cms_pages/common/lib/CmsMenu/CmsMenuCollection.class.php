<?php

class CmsMenuCollection extends  mfObjectCollection3 {
    
       
    
     function getMenus()
     {         
         if ($this->menus===null)
         {    
            $this->menus=new mfArray();
            if ($this->isEmpty())
               return $this->menus;
            foreach ($this as $menu)
            {
               $this->menus[$menu->get('id')]=$menu; 
            }              
         }
         return $this->menus;
     }
     
      function getPath()
     {
         if ($this->path===null)
         {    
            $this->path=new mfArray();
            if ($this->isEmpty())
               return $this->path;
            foreach ($this as $menu)
            {
               $this->path[]=$menu->get('name'); 
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
            foreach ($this as $menu)
            {
               $this->path_i18n[]=$menu->hasI18n()?(string)$menu->getI18n():$menu->get('name'); 
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
            foreach ($this as $menu)
            {
               $this->url_path_i18n[]=$menu->hasI18n()?$menu->getI18n()->get('url'):$menu->get('name'); 
            }              
         }
         return $this->url_path_i18n; 
     }
    
   
}

