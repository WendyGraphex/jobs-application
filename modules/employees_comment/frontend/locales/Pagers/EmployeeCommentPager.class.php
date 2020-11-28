<?php


class EmployeeCommentPager extends mfPager2 {
    
    function __construct() {        
         parent::__construct(array("EmployeeAdvertComment", "EmployerUser","EmployeeAdvertCommentI18n",));                      
    }
    
    protected function fetchObjects($db)
    {            
       while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getEmployeeAdvertComment();    
            if (!isset($this->items[$item->get('id')]))
                $this->items[$item->get('id')]=$item;               
            $this->items[$item->get('id')]->getI18ns()->push($items->getEmployeeAdvertCommentI18n());
       }               
    } 
    
   
    function getNumberOfComments()
    {
        return  new mfIntegerFormatter($this->getNbItems(),array('choices'=>"[0]No comment|[1]one comment|(1,Inf]%s comments"));
    }
}