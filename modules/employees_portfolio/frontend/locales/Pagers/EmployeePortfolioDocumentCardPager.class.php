<?php


class EmployeePortfolioDocumentCardPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeePortfolioDocument","EmployeePortfolioDocumentI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeePortfolioDocument();          
            $item->setI18n($items->hasEmployeePortfolioDocumentI18n()?$items->getEmployeePortfolioDocumentI18n():false);
            $this->items[$item->get('id')]=$item;   
       }         
    } 
}