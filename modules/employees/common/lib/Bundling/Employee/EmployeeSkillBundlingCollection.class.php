<?php


class EmployeeSkillBundlingCollection extends mfArray {
    
      
    
    
    function loadEmployees($filter)
    {                      
       $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>mfContext::getInstance()->getUser()->getLanguage()))
            ->setObjects(array("Employee","EmployeeUserSkill"))           
            ->setQuery((string)mfQuery::getInstance()->select("{fields}")
                    ->from(Employee::getTable())                                     
                    ->inner(EmployeeUserSkill::getInnerForJoin('employee_user_id'))  
                    ->inner(EmployeeUserSkill::getOuterForJoin('skill_id'))   
                    ->inner(EmployeeSkillI18n::getInnerForJoin('skill_id')) 
                    ->where($filter->getWhere())
                    ->where(EmployeeUserSkill::getTableField('skill_id')." IN('".$this->getKeys()->implode("','")."')"))
            ->makeSqlQuery();             
       // echo $db->getQuery();
        if (!$db->getNumRows())
            return $this;        
        while ($items = $db->fetchObjects()) 
       {                            
            $item=$items->getEmployee();                                       
            $this->getItemByKey($items->getEmployeeUserSkill()->get('skill_id'))->getEmployees()->push($item);                
       }                            
      //  EmployeeAdvertDocument::getMediasForCollection($this->adverts); */
        return $this;
    }
    
}
