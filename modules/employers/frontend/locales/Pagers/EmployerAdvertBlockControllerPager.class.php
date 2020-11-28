<?php


class EmployerAdvertBlockControllerPager extends Pager2 {
    
    function __construct() {        
         parent::__construct(array("EmployerAdvert","EmployerAdvertI18n","EmployerUser"));              
         $this->adverts=new EmployerAdvertCollection();
    }
    
    protected function fetchObjects($db)
    {            
       while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getEmployerAdvertI18n();              
            $item->set('advert_id',$items->getEmployerAdvert());
            $item->getAdvert()->set('employer_user_id',$items->getEmployerUser());        
            $this->items[$item->get('id')]=$item;               
       }         
     //  EmployerAdvertDocument::getMediasForPager($this);          
    } 
    
    function getNumberOfAdverts()
    {
        return new FloatFormatter($this->getNbItems());
    }
    
      
    
}