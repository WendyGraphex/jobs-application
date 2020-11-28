<?php


class EmployeeAdvertEmployeePager extends Pager2 {
    
     protected $user=null;
    
    function __construct($user) {           
         $this->user=$user->isAuthenticated() && ($user->isEmployee() || $user->isEmployerUser())?$user->getGuardUser():null;    
         parent::__construct(array("EmployeeAdvert","EmployeeAdvertI18n"));              
         $this->adverts=new EmployeeAdvertCollection();
    }
    
    protected function fetchObjects($db)
    {            
       while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getEmployeeAdvertI18n();           
           // if (!$this->getAdverts()->hasItemByKey($items->getEmployeeAdvert()->get('id')))
            $this->getAdverts()->push($items->getEmployeeAdvert());    
            $item->set('advert_id',$items->getEmployeeAdvert());           
            $this->items[$item->get('id')]=$item;               
       }         
       EmployeeAdvertDocument::getMediasForPager($this);          
    } 
       
    function getAdverts()
    {        
        return $this->adverts;
    }
    
    function getUser()
    {
        return $this->user;
    }
}