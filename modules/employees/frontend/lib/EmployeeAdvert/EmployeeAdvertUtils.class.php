<?php


class EmployeeAdvertUtils extends EmployeeAdvertUtilsBase {
    
        
      static function getFormattedLanguagesForSelect()
    {
          $languages=new mfArray();   
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT lang FROM ".EmployeeAdvertI18n::getTable().
                           " WHERE ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
                           " GROUP BY lang".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return  $languages;      
        while ($row=$db->fetchArray())
        {          
            $languages[$row['lang']]= ucfirst(format_language($row['lang']));
        }               
        return $languages->asort();
    }
    
     static function getFormattedCountriesForSelect()
    {
        $list=new mfArray();   
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT ".Employee::getTableField('country')." FROM ".EmployeeAdvertI18n::getTable().
                           " INNER JOIN ".EmployeeAdvertI18n::getOuterForJoin('advert_id').
                            " INNER JOIN ".EmployeeAdvert::getOuterForJoin('employee_user_id').    
                            " WHERE ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
                           " GROUP BY ".Employee::getTableField('country').
                           ";")               
                ->makeSqlQuery();
       // echo $db->getQuery();
        if (!$db->getNumRows())
            return  $list;      
        while ($row=$db->fetchArray())
        {          
            $list[$row['country']]= ucfirst(format_country($row['country']));
        }              
        return $list->asort();
    } 
    
     static function getSkillsForSelect($lang=null)
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployeeSkillI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeSkill::getTable().
                       " INNER JOIN ".EmployeeSkillI18n::getInnerForJoin('skill_id').
                       " INNER JOIN ".EmployeeUserSkill::getInnerForJoin('skill_id'). 
                       " INNER JOIN ".EmployeeUserSkill::getOuterForJoin('employee_user_id'). 
                       " INNER JOIN ".EmployeeAdvert::getInnerForJoin('employee_user_id').
                       " INNER JOIN ".EmployeeAdvertI18n::getInnerForJoin('advert_id').
                       " WHERE ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
                                " AND ".EmployeeSkillI18n::getTableField('lang')."='{lang}'".
                       " GROUP BY ".EmployeeSkill::getTableField('id').
                       " ORDER BY ".EmployeeSkillI18n::getTableField('title')." ASC ".
                       ";")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $list;       
         while ($item=$db->fetchObject('EmployeeSkillI18n'))
        {          
            $list[$item->get('skill_id')]= ucfirst($item);
        }              
       // echo "<pre>"; var_dump($list); echo "</pre>"; 
        return $list;
    }
    
      static function getExperiencesForSelect($lang=null)
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployeeExperienceI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeExperience::getTable().
                       " INNER JOIN ".EmployeeExperienceI18n::getInnerForJoin('experience_id').
                       " INNER JOIN ".Employee::getInnerForJoin('experience_id').                      
                       " INNER JOIN ".EmployeeAdvert::getInnerForJoin('employee_user_id').
                       " INNER JOIN ".EmployeeAdvertI18n::getInnerForJoin('advert_id').
                       " WHERE ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
                                " AND ".EmployeeExperienceI18n::getTableField('lang')."='{lang}'".
                       " GROUP BY ".EmployeeExperience::getTableField('id').
                       " ORDER BY ".EmployeeExperience::getTableField('position')." ASC ".
                       ";")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $list;       
         while ($item=$db->fetchObject('EmployeeExperienceI18n'))
        {          
            $list[$item->get('experience_id')]= ucfirst($item);
        }              
       // echo "<pre>"; var_dump($list); echo "</pre>"; 
        return $list;
    }
    
     static function getLevelsForSelect($lang=null)
    {     
        $list=new mfArray();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployeeStudyLevelI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeStudyLevel::getTable().
                       " INNER JOIN ".EmployeeStudyLevelI18n::getInnerForJoin('level_id').
                       " INNER JOIN ".Employee::getInnerForJoin('level_id').                      
                       " INNER JOIN ".EmployeeAdvert::getInnerForJoin('employee_user_id').
                       " INNER JOIN ".EmployeeAdvertI18n::getInnerForJoin('advert_id').
                       " WHERE ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
                                " AND ".EmployeeStudyLevelI18n::getTableField('lang')."='{lang}'".
                       " GROUP BY ".EmployeeStudyLevel::getTableField('id').
                       " ORDER BY ".EmployeeStudyLevel::getTableField('position')." ASC ".
                       ";")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $list;       
         while ($item=$db->fetchObject('EmployeeStudyLevelI18n'))
        {          
            $list[$item->get('level_id')]= ucfirst($item);
        }             
        // echo "<pre>"; var_dump($list); echo "</pre>"; 
        return $list;
    }
    
    
      static function getUserLanguagesForSelect($lang=null)
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployeeUserLanguage::getTableField('lang')." FROM ".EmployeeUserLanguage::getTable().                                        
                       " INNER JOIN ".EmployeeUserLanguage::getOuterForJoin('employee_user_id'). 
                       " INNER JOIN ".EmployeeAdvert::getInnerForJoin('employee_user_id').
                       " INNER JOIN ".EmployeeAdvertI18n::getInnerForJoin('advert_id').
                       " WHERE ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
                       " GROUP BY ".EmployeeUserLanguage::getTableField('lang').                     
                       ";")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $list;       
       while ($row=$db->fetchArray())
        {          
            $list[$row['lang']]= ucfirst(format_language($row['lang']));
        }              
     //   echo "<pre>"; var_dump($list); echo "</pre>"; 
        return $list;
    }
    
    
     static function getLanguagesForSelect()
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT lang FROM ".EmployeeAdvertI18n::getTable().                
                       " INNER JOIN ".EmployeeAdvertI18n::getOuterForJoin('advert_id').
                       " INNER JOIN ".EmployeeAdvert::getOuterForJoin('employee_user_id').                    
                       " WHERE ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
                       " GROUP BY ".EmployeeAdvertI18n::getTableField('lang').                     
                       ";")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $list;       
       while ($row=$db->fetchArray())
        {          
            $list[$row['lang']]= ucfirst(format_language($row['lang']));
        }              
     //   echo "<pre>"; var_dump($list); echo "</pre>"; 
        return $list;
    }
    
    
     static function getSearchCity($query)
    {
         $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('query'=>$query))
            ->setQuery("SELECT ".Employee::getTableField('country').",".Employee::getTableField('city').
                       " FROM ".EmployeeAdvertI18n::getTable().            
                       " INNER JOIN ".EmployeeAdvertI18n::getOuterForJoin('advert_id').
                       " INNER JOIN ".EmployeeAdvert::getOuterForJoin('employee_user_id').                                        
                       " WHERE ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
                                " AND ".Employee::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{query}%%' ".                                       
                       " GROUP BY city,country".                                                       
                       ";")
            ->makeSqlQuery();   
       //  echo $db->getQuery();
          if (!$db->getNumRows())
            return $list;       
       while ($item=$db->fetchObject('CustomerCityCountry'))
        {                     
            $list[]=$item->toArray();
        }              
     //   echo "<pre>"; var_dump($list); echo "</pre>"; 
        return $list;                        
    }
    
    
     static function getMinBudget()
    {     
         static $min=null;
         
         if ($min) return $min;
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT MIN(budget) FROM ".EmployeeAdvertI18n::getTable().                
                       " INNER JOIN ".EmployeeAdvertI18n::getOuterForJoin('advert_id').
                       " INNER JOIN ".EmployeeAdvert::getOuterForJoin('employee_user_id').                    
                       " WHERE ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".                            
                       ";")
            ->makeSqlQuery();   
        $row=$db->fetchRow();   
        return $min=intval($row[0]);
    }
    
     static function getMaxBudget()
    {             
         static $max=null;
         
         if ($max) return $max;
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT MAX(budget) FROM ".EmployeeAdvertI18n::getTable().                
                       " INNER JOIN ".EmployeeAdvertI18n::getOuterForJoin('advert_id').
                       " INNER JOIN ".EmployeeAdvert::getOuterForJoin('employee_user_id').                    
                       " WHERE ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".                            
                       ";")
            ->makeSqlQuery();   
        $row=$db->fetchRow();      
        return $max=intval($row[0]);
    }
}

