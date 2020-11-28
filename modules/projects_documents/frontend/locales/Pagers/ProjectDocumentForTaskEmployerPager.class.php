<?php


class ProjectDocumentForTaskEmployerPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'ProjectDocument',
          
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getProjectDocument();                                                      
              $this->items[$item->get('id')]=$item;                  
       }                 
      
    }
   
    
}

