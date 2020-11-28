<?php


class ProjectTaskStatePager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'ProjectTaskState',
           'ProjectTaskStateI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getProjectTaskState();                
              $item->setI18n($items->hasProjectTaskStateI18n()?$items->getProjectTaskStateI18n():0);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}

