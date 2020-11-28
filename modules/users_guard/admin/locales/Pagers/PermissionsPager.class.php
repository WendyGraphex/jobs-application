<?php


class PermissionsPager extends Pager {
    
   function __construct() {        
        parent::__construct(array("PermissionI18n","Permission"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                 
              $item=$items->getPermission();                 
              $item->set('i18n',($items->hasPermissionI18n()?$items->getPermissionI18n():null));                                                                                        
              $this->items[$item->get('id')]=$item;                            
       }         
    }
}