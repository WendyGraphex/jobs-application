<?php


class EmployerAdvertCountryBundlingCollection extends mfArray {
    
      
    
    
    function loadI18nAdverts($query)
    {                                 
      $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setObjects(array("EmployerAdvert","EmployerAdvertI18n","EmployerUser"))           
            ->setQuery((string)mfQuery::getInstance()->select("{fields},".Country::getTableField('code')." as country")
                    ->from(EmployerAdvert::getTable())                  
                    ->inner(EmployerAdvertI18n::getInnerForJoin('advert_id'))                 
                    ->inner(EmployerAdvert::getOuterForJoin('employer_user_id'))     
                    ->left(EmployerUser::getOuterForJoin('company_id'))     
                    ->inner(Country::getTable()." ON ".Country::getTableField('code')."=".EmployerUser::getTableField('country')." OR ".
                              Country::getTableField('code')."=".EmployerCompany::getTableField('country'))
                    ->where($query->getWhere())
                    ->where("(".EmployerUser::getTableField('country')." IN('".$this->getKeys()->implode("','")."') OR ".
                            EmployerCompany::getTableField('country')." IN('".$this->getKeys()->implode("','")."') ".
                            ")"
                            ))
            ->makeSqlQuery();             
     //   echo $db->getQuery();
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
            $this->getItemByKey($items->get('country'))->getI18nAdverts()->push($item);                   
       }                         
        EmployerAdvertDocument::getMediasForCollection($this->adverts);       
        return $this;
    }
    
}
