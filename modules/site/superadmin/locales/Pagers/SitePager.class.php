<?php


class SitePager extends Pager {

    function __construct()
    {
        parent::__construct('site');
    }
    
    
    protected function fetchObject($db)
    {                     
      while ($row = $db->fetchObject($this->class)) 
      {            
          // echo "<pre>"; var_dump($row->get('site_db_name')); echo "</pre>";
            if (isset($this->items[$row->get('site_db_name')]->hosts))
            {    
                $this->items[$row->get('site_db_name')]->hosts[]=$row->loaded();        
            }
            else
            {                   
                $this->items[$row->get('site_db_name')]=$row->loaded();
                $this->items[$row->get('site_db_name')]->hosts=array();   
            }    
      }
     //  echo "<pre>"; var_dump($this->items); echo "</pre>";
    }
}


