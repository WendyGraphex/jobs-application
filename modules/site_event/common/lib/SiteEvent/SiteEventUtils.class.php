<?php


class SiteEventUtils  {
    
     static function getMinPrice()
    {     
         static $min=null;
         
         if ($min) return $min;
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT MIN(price) FROM ".SiteEvent::getTable().                                      
                       " WHERE ".SiteEvent::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".SiteEvent::getTableField('status')."='ACTIVE'".                            
                       ";")
            ->makeSqlQuery();   
        $row=$db->fetchRow();   
        return $min=intval($row[0]);
    }
    
     static function getMaxPrice()
    {             
         static $max=null;
         
         if ($max) return $max;
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT MAX(price) FROM ".SiteEvent::getTable().                                      
                       " WHERE ".SiteEvent::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".SiteEvent::getTableField('status')."='ACTIVE'".                            
                       ";")
            ->makeSqlQuery();   
        $row=$db->fetchRow();   
        return $max=intval($row[0]);
    }
    
     static function getFormattedCountriesForSelect()
    {
        $list=new mfArray();   
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT ".SiteEvent::getTableField('country')." as country ".
                           " FROM ".SiteEvent::getTable().                            
                           " GROUP BY country".                          
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
    
    
     static function getLanguagesForSelect()
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT lang FROM ".SiteEventI18n::getTable().  
                       " INNER JOIN ".SiteEventI18n::getOuterForJoin('event_id').
                       " WHERE ".SiteEvent::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".SiteEvent::getTableField('status')."='ACTIVE'".
                       " GROUP BY ".SiteEventI18n::getTableField('lang').                     
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
    
    static function getLast($limit=5)
    {
         $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('limit'=>$limit,'lang'=>mfContext::getInstance()->getUser()->getLanguage()))
            ->setObjects(array('SiteEvent','SiteEventI18n'))
            ->setQuery("SELECT {fields} FROM ".SiteEventI18n::getTable().  
                       " INNER JOIN ".SiteEventI18n::getOuterForJoin('event_id').
                       " WHERE ".SiteEvent::getTableField('published_at')." IS NOT NULL".                                                  
                                " AND ".SiteEvent::getTableField('status')."='ACTIVE'". 
                                " AND ".SiteEventI18n::getTableField('lang')."='{lang}'".
                       " LIMIT 0,{limit}".
                       ";")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $list;       
       while ($items=$db->fetchObjects())
        {          
            $item=$items->getSiteEventI18n();
            $item->set('event_id',$items->getSiteEvent());
            $list[$item->get('id')]= $item;
        }              
    //    echo "<pre>"; var_dump($list); echo "</pre>"; 
        return $list;
    }
}
