<?php


class EmployeeSearchSkillLetter extends mfString {
    
    
    
    function getUrl()
    {
       return link_i18n('employees_search_skill_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
     static function getSkillsByLetter($letter)
    {              
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('letter'=>$letter,'lang'=>mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployeeSkillI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeSkillI18n::getTable().
                       " INNER JOIN ".EmployeeSkillI18n::getOuterForJoin('skill_id').                                
                       " WHERE ".EmployeeSkillI18n::getTableField('lang')."='{lang}'".
                               " AND ".EmployeeSkillI18n::getTableField('title')." LIKE '{letter}%%'".                                  
                       ";")
            ->makeSqlQuery();         
          if (!$db->getNumRows())
            return $list;       
         while ($item=$db->fetchObject('EmployeeSkillI18n'))           
            $list[$item->get('skill_id')]= ucfirst($item);     
        return $list;
    }
    
     static function getLetters($lang=null)
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT SUBSTRING(".EmployeeSkillI18n::getTableField('title').",1,1) as letter FROM ".EmployeeSkillI18n::getTable().
                       " INNER JOIN ".EmployeeSkillI18n::getOuterForJoin('skill_id').
                       " INNER JOIN ".EmployeeUserSkill::getInnerForJoin('skill_id'). 
                       " INNER JOIN ".EmployeeUserSkill::getOuterForJoin('employee_user_id').                     
                       " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'". 
                                " AND ".EmployeeSkillI18n::getTableField('lang')."='{lang}'".
                       " GROUP BY letter".
                       " ORDER BY letter ASC ".
                       ";")
            ->makeSqlQuery();         
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchRow())
        {          
            $list[]= new EmployeeSearchSkillLetter(strtoupper($row[0]));
        }                   
        return $list;
    }
    
}
