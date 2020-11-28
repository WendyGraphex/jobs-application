<?php


class EmployerAdvertCityBundlingCollection extends mfArray {
    
      
     
    
    function loadI18nAdverts($pager)
    {           
       $where=new mfArray();
       foreach ($this as $item)       
          $where[]="(`code`='".$item->getCountry()->getCode()."' AND ".
                        "(".EmployerUser::getTableField('city')."='".$item->getCity()->getValue()."' OR ".
                            EmployerCompany::getTableField('city')."='".$item->getCity()->getValue()."')".
                   ")";      
      
       $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setObjects(array("EmployerAdvert","EmployerAdvertI18n","EmployerUser","EmployerCompany"))           
            ->setQuery((string)mfQuery::getInstance()->select("{fields},".Country::getTableField('code')." as `code`,IF(".EmployerUser::getTableField('company_id')." IS NULL,".EmployerUser::getTableField('city').",".EmployerCompany::getTableField('city').") as `city`")
                    ->from(EmployerAdvert::getTable())                  
                    ->inner(EmployerAdvertI18n::getInnerForJoin('advert_id'))                 
                    ->inner(EmployerAdvert::getOuterForJoin('employer_user_id'))    
                    ->left(EmployerUser::getOuterForJoin('company_id')) 
                    ->inner(Country::getTable()." ON ".Country::getTableField('code')."=".EmployerUser::getTableField('country')." OR ".
                              Country::getTableField('code')."=".EmployerCompany::getTableField('country'))
                    ->where($pager->getQuery()->getWhere())
                    ->where($where,"OR"))
            ->makeSqlQuery();             
       // echo $db->getQuery();   die(__METHOD__);
         
        if (!$db->getNumRows())
            return $this; 
        $this->adverts=new EmployerAdvertCollection();
        while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getEmployerAdvertI18n();                      
             if (!$this->adverts->hasItemByKey($items->getEmployerAdvert()->get('id')))
                 $this->adverts->push($items->getEmployerAdvert());             
            $item->set('advert_id',$this->adverts[$items->getEmployerAdvert()->get('id')]);
            $item->getAdvert()->set('employer_user_id',$items->getEmployerUser());                  
            $item->getAdvert()->getEmployerUser()->set('company_id',$items->hasEmployerCompany()?$items->getEmployerCompany():false);            
            $this->getItemByKey($items->get('code')."_".$items->get('city'))->getI18nAdverts()->push($item);                      
       }                      
        EmployerAdvertDocument::getMediasForCollection($this->adverts);
        return $this;
    }
    
}
