<?php


class EmployeeAdvertCountryBundlingCollection extends mfArray {
    
      
    
    
    function loadI18nAdverts($filter)
    {                      
      $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setObjects(array("EmployeeAdvert","EmployeeAdvertI18n","Employee"))           
            ->setQuery((string)mfQuery::getInstance()->select("{fields}")
                    ->from(EmployeeAdvert::getTable())                  
                    ->inner(EmployeeAdvertI18n::getInnerForJoin('advert_id'))                 
                    ->inner(EmployeeAdvert::getOuterForJoin('employee_user_id'))     
                    ->where($filter->getWhere())
                    ->where(Employee::getTableField('country')." IN('".$this->getKeys()->implode("','")."')"))
            ->makeSqlQuery();             
       
        if (!$db->getNumRows())
            return $this; 
        $this->adverts=new EmployeeAdvertCollection();
        while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getEmployeeAdvertI18n();                      
            $item=$items->getEmployeeAdvertI18n();                      
             if (!$this->adverts->hasItemByKey($items->getEmployeeAdvert()->get('id')))
                 $this->adverts->push($items->getEmployeeAdvert());             
            $item->set('advert_id',$this->adverts[$items->getEmployeeAdvert()->get('id')]);
            $item->getAdvert()->set('employee_user_id',$items->getEmployee());                  
            $this->getItemByKey($item->getAdvert()->getEmployeeUser()->get('country'))->getI18nAdverts()->push($item);                      
       }                         
        EmployeeAdvertDocument::getMediasForCollection($this->adverts);
        return $this;
    }
    
}
