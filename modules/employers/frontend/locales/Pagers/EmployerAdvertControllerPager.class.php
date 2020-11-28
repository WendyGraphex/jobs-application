<?php


class EmployerAdvertControllerPager extends Pager2 {
    
    protected $user=null;
    
    function __construct($user) {           
         $this->user=$user->isAuthenticated() && ($user->isEmployee() || $user->isEmployerUser())?$user->getGuardUser():null;           
         parent::__construct(array("EmployerAdvert","EmployerAdvertI18n","EmployerCompany","EmployerUser"));              
         $this->adverts=new EmployerAdvertCollection();
    }
    
    protected function fetchObjects($db)
    {            
       while ($items = $db->fetchObjects()) 
       {             
            $item=$items->getEmployerAdvertI18n();   
            if (!$this->adverts->hasItemByKey($items->getEmployerAdvert()->get('id')))
                 $this->adverts->push($items->getEmployerAdvert());             
            $item->set('advert_id',$this->adverts[$items->getEmployerAdvert()->get('id')]);
            $item->getAdvert()->set('employer_user_id',$items->getEmployerUser());
            $item->getAdvert()->getEmployerUser()->set('company_id',$items->hasEmployerCompany()?$items->getEmployerCompany():false);
            $this->items[$item->get('id')]=$item;          
       }         
        EmployerAdvertDocument::getMediasForPager($this);      
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