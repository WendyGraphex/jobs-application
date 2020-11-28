<?php


class EmployeeAdvertSkillBundlingCollection extends mfArray {
    
      
    
    
    function loadI18nAdverts($filter)
    {                      
      $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>mfContext::getInstance()->getUser()->getLanguage()))
            ->setObjects(array("EmployeeAdvert","EmployeeAdvertI18n","Employee","EmployeeUserSkill"))           
            ->setQuery((string)mfQuery::getInstance()->select("{fields}")
                    ->from(EmployeeAdvert::getTable())                  
                    ->inner(EmployeeAdvertI18n::getInnerForJoin('advert_id'))                 
                    ->inner(EmployeeAdvert::getOuterForJoin('employee_user_id'))   
                    ->inner(EmployeeUserSkill::getInnerForJoin('employee_user_id'))  
                    ->inner(EmployeeUserSkill::getOuterForJoin('skill_id'))   
                    ->inner(EmployeeSkillI18n::getInnerForJoin('skill_id')) 
                    ->where($filter->getWhere())
                    ->where(EmployeeUserSkill::getTableField('skill_id')." IN('".$this->getKeys()->implode("','")."')"))
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
            $this->getItemByKey($items->getEmployeeUserSkill()->get('skill_id'))->getI18nAdverts()->push($item);                
       }                            
        EmployeeAdvertDocument::getMediasForCollection($this->adverts); 
        return $this;
    }
    
}
