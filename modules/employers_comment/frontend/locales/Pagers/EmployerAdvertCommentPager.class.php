<?php


class EmployerAdvertCommentPager extends mfPager2 {
    
    function __construct() {        
         parent::__construct(array("EmployerAdvertComment", "Employee","EmployerAdvertCommentI18n",));                      
    }
    
    protected function fetchObjects($db)
    {            
       while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getEmployerAdvertComment();    
            if (!isset($this->items[$item->get('id')]))
                $this->items[$item->get('id')]=$item;               
            $this->items[$item->get('id')]->getI18ns()->push($items->getEmployerAdvertCommentI18n());
       }               
    } 
    
   
    function getNumberOfComments()
    {
        return  new mfIntegerFormatter($this->getNbItems(),array('choices'=>"[0]No comment|[1]One comment|(1,Inf]%s comments"));
    }
}