<?php


class EmployeeAdvertBlockControllerPager extends Pager2 {
    
    function __construct() {        
         parent::__construct(array("EmployeeAdvert","EmployeeAdvertI18n","Employee"));              
         $this->adverts=new EmployeeAdvertCollection();
    }
    
    protected function fetchObjects($db)
    {            
       while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getEmployeeAdvertI18n();             
            $item->set('advert_id',$items->getEmployeeAdvert());
            $item->getAdvert()->set('employee_user_id',$items->getEmployee());        
            $this->items[$item->get('id')]=$item;               
       }         
     //  EmployeeAdvertDocument::getMediasForPager($this);          
    } 
    
    function getNumberOfAdverts()
    {
        return new FloatFormatter($this->getNbItems());
    }
    
   
}