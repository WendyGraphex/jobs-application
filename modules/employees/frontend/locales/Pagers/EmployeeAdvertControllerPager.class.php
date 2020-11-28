<?php


class EmployeeAdvertControllerPager extends Pager2 {
    
     protected $user=null;
    
    function __construct($user) {           
         $this->user=$user->isAuthenticated() && ($user->isEmployee() || $user->isEmployerUser())?$user->getGuardUser():null;    
         parent::__construct(array("EmployeeAdvert","EmployeeAdvertI18n","Employee"));              
         $this->adverts=new EmployeeAdvertCollection();
    }
    
    protected function fetchObjects($db)
    {            
       while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getEmployeeAdvertI18n();   
            if (!$this->adverts->hasItemByKey($items->getEmployeeAdvert()->get('id')))
                 $this->adverts->push($items->getEmployeeAdvert());             
            $item->set('advert_id',$this->adverts[$items->getEmployeeAdvert()->get('id')]);
            $item->getAdvert()->set('employee_user_id',$items->getEmployee());        
            $this->items[$item->get('id')]=$item;               
       }         
       EmployeeAdvertDocument::getMediasForPager($this);          
    } 
    
    function getNumberOfAdverts()
    {
        return new FloatFormatter($this->getNbItems());
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