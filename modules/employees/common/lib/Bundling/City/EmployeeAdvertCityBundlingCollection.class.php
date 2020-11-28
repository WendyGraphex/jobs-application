<?php


class EmployeeAdvertCityBundlingCollection extends mfArray {
    
      
    /*
     * .
                                        " SELECT MAX(id) FROM ".CustomerContractBilling::getTable().   
                                        " WHERE contract_id IN('".implode("','",$ids)."')".
                                        " GROUP BY contract_id".
     */
    
    function loadI18nAdverts($filter)
    {      
       $where=new mfArray();
       foreach ($this as $item)       
          $where[]="(".Employee::getTableField('country')."='".$item->getCountry()->getCode()."' AND ".Employee::getTableField('city')."='".$item->getCity()->getValue()."')";      
        
       $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setObjects(array("EmployeeAdvert","EmployeeAdvertI18n","Employee"))           
            ->setQuery((string)mfQuery::getInstance()->select("{fields}")
                    ->from(EmployeeAdvert::getTable())                  
                    ->inner(EmployeeAdvertI18n::getInnerForJoin('advert_id'))                 
                    ->inner(EmployeeAdvert::getOuterForJoin('employee_user_id'))    
                   // ->inner("(SELECT MAX(".EmployeeAdvert::getTableField('id').") FROM ".EmployeeAdvert::getTable().") as tmp ON tmp.id = ".EmployeeAdvert::getTableField('id'))
                    ->where($filter->getWhere())
                    ->where($where->implode(' OR ')))
            ->makeSqlQuery();             
      //  echo $db->getQuery();   
        if (!$db->getNumRows())
            return $this; 
        $this->adverts=new EmployeeAdvertCollection();
        while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getEmployeeAdvertI18n();                      
             if (!$this->adverts->hasItemByKey($items->getEmployeeAdvert()->get('id')))
                 $this->adverts->push($items->getEmployeeAdvert());             
            $item->set('advert_id',$this->adverts[$items->getEmployeeAdvert()->get('id')]);
            $item->getAdvert()->set('employee_user_id',$items->getEmployee());                  
            $this->getItemByKey($item->getAdvert()->getEmployeeUser()->get('country')."_".$item->getAdvert()->getEmployeeUser()->get('city'))->getI18nAdverts()->push($item);                      
       }               
        EmployeeAdvertDocument::getMediasForCollection($this->adverts);
        return $this;
    }
    
}
