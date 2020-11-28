<?php


class EmployerPartnerWorkCategoryPager extends Pager {
    
     protected $user=null;
    
    function __construct($user) {           
         $this->user=$user->isAuthenticated() && ($user->isEmployee() || $user->isEmployerUser())?$user->getGuardUser():null;    
        parent::__construct(array("EmployerAdvert","EmployerAdvertI18n","EmployerUser","EmployerCompany"));   
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
      //    echo mfSiteDatabase::getInstance()->getQuery();   
       EmployerAdvertDocument::getMediasForPager($this);       
     //  echo "<pre>"; var_dump($this->items);     
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