<?php


class  UserPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'User',
          /* 'UserProfession','UserProfessionI18n',
           'UserSpeciality','UserSpecialityI18n',
           'ContentGroup',
           'Language','SiteCountry'*/
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       while ($items = $db->fetchObjects()) 
       {                            
              $item=$items->getUser();  
            /*  $item->set('profession_id',$items->hasUserProfession()?$items->getUserProfession():false);
              $item->set('content_group_id',$items->hasContentGroup()?$items->getContentGroup():false);
              if ($items->hasContentGroup())
              {    
                $item->getContentGroup()->set('language_id',$items->hasLanguage()?$items->getLanguage():false);
                $item->getContentGroup()->set('country_id',$items->hasSiteCountry()?$items->getSiteCountry():false);
              }  
              if ($item->hasProfession())
                  $item->getProfession()->setI18n($items->hasUserProfessionI18n()?$items->getUserProfessionI18n():false);                          
              $item->set('specialty_id',$items->hasUserSpeciality()?$items->getUserSpeciality():false);
              if ($item->hasSpeciality())
                  $item->getSpeciality()->setI18n($items->hasUserSpecialityI18n()?$items->getUserSpecialityI18n():false);*/ 
              $this->items[$item->get('id')]=$item;                            
       }  
       
      
    }
   
    
}

