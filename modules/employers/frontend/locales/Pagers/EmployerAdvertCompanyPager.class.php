<?php


class EmployerAdvertCompanyPager extends Pager2 {
    
     protected $user=null;
    
     function __construct($user) {           
         $this->user=$user->isAuthenticated() && ($user->isEmployee() || $user->isEmployerUser())?$user->getGuardUser():null;     
         parent::__construct(array("EmployerAdvert","EmployerAdvertI18n","EmployerUser"));              
         $this->adverts=new EmployerAdvertCollection();
    }
    
    protected function fetchObjects($db)
    {            
       while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getEmployerAdvertI18n();   
            $items->getEmployerAdvert()->set('employer_user_id',$items->getEmployerUser());
           // if (!$this->getAdverts()->hasItemByKey($items->getEmployerAdvert()->get('id')))
            $this->getAdverts()->push($items->getEmployerAdvert());    
            $item->set('advert_id',$items->getEmployerAdvert());           
            $this->items[$item->get('id')]=$item;               
       }         
       EmployerAdvertDocument::getMediasForPager($this);          
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