<?php


class GroupsPager extends Pager {
    
   function __construct() {        
        parent::__construct(array("GroupI18n","Group"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                 
              $item=$items->getGroup();                 
              $item->set('i18n',($items->hasGroupI18n()?$items->getGroupI18n():null));                                                                                        
              $this->items[$item->get('id')]=$item;                            
       }         
    }
}