<?php


class PartnerEmployerAdvertControllerPager extends Pager2 {
    
    function __construct() {        
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
     //  EmployerAdvertDocument::getMediasForPager($this);      
    } 
    
    function getNumberOfAdverts()
    {
        return new FloatFormatter($this->getNbItems());
    }
    
    function getAdverts()
    {        
        return $this->adverts;
    }    
    
}