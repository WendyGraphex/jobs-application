<?php


class EmployerAdvertUtils extends EmployerAdvertUtilsBase {
    
        
     static function getUserLanguagesForSelect($lang=null)
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployerUserLanguage::getTableField('lang')." FROM ".EmployerUserLanguage::getTable().                                        
                       " INNER JOIN ".EmployerUserLanguage::getOuterForJoin('employer_user_id'). 
                       " INNER JOIN ".EmployerAdvert::getInnerForJoin('employer_user_id').
                       " INNER JOIN ".EmployerAdvertI18n::getInnerForJoin('advert_id').
                       " WHERE ".EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".
                       " GROUP BY ".EmployerUserLanguage::getTableField('lang').                     
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
            ->setQuery("SELECT lang FROM ".EmployerAdvertI18n::getTable().                
                       " INNER JOIN ".EmployerAdvertI18n::getOuterForJoin('advert_id').
                       " INNER JOIN ".EmployerAdvert::getOuterForJoin('employer_user_id').                    
                       " WHERE ".EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".
                       " GROUP BY ".EmployerAdvertI18n::getTableField('lang').                     
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
            ->setQuery("SELECT IF(".EmployerUser::getTableField('company_id')." IS NULL,".EmployerUser::getTableField('country').",".EmployerCompany::getTableField('country').") as country, ".
                               " IF(".EmployerUser::getTableField('company_id')." IS NULL,".EmployerUser::getTableField('city').",".EmployerCompany::getTableField('city').") as city ".          
                       " FROM ".EmployerAdvertI18n::getTable().            
                       " INNER JOIN ".EmployerAdvertI18n::getOuterForJoin('advert_id').
                       " INNER JOIN ".EmployerAdvert::getOuterForJoin('employer_user_id').                    
                       " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id'). 
                       " WHERE ".EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".
                                " AND (".EmployerUser::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{query}%%' OR ".      
                                         EmployerCompany::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{query}%%' )".      
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
            ->setQuery("SELECT MIN(budget) FROM ".EmployerAdvertI18n::getTable().                
                       " INNER JOIN ".EmployerAdvertI18n::getOuterForJoin('advert_id').
                       " INNER JOIN ".EmployerAdvert::getOuterForJoin('employer_user_id').                    
                       " WHERE ".EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".                            
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
            ->setQuery("SELECT MAX(budget) FROM ".EmployerAdvertI18n::getTable().                
                       " INNER JOIN ".EmployerAdvertI18n::getOuterForJoin('advert_id').
                       " INNER JOIN ".EmployerAdvert::getOuterForJoin('employer_user_id').                    
                       " WHERE ".EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".                            
                       ";")
            ->makeSqlQuery();   
        $row=$db->fetchRow();   
        return $max=intval($row[0]);
    }
}

