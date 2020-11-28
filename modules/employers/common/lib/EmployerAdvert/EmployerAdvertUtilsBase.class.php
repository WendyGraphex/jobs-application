<?php


class EmployerAdvertUtilsBase {
    
        
    
     static function getFormattedLanguagesForSelect()
    {
          $languages=new mfArray();   
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT lang FROM ".EmployerAdvertI18n::getTable().
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
                ->setQuery("SELECT ".EmployerUser::getTableField('country')." FROM ".EmployerAdvertI18n::getTable().
                           " INNER JOIN ".EmployerAdvertI18n::getOuterForJoin('advert_id').
                            " INNER JOIN ".EmployerAdvert::getOuterForJoin('employer_user_id').
                        //   " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id')." AND ".EmployerCompany::getTable('country')."!=''".                           
                           " GROUP BY ".EmployerUser::getTableField('country').
                           ";")               
                ->makeSqlQuery();
       // echo $db->getQuery();
        if (!$db->getNumRows())
            return  $list;      
        while ($row=$db->fetchArray())
        {          
            $list[$row['country']]= ucfirst(format_country($row['country']));
        }       
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT ".EmployerCompany::getTableField('country')." FROM ".EmployerAdvertI18n::getTable().
                           " INNER JOIN ".EmployerAdvertI18n::getOuterForJoin('advert_id').
                           " INNER JOIN ".EmployerAdvert::getOuterForJoin('employer_user_id').
                           " INNER JOIN ".EmployerUser::getOuterForJoin('company_id').             
                           " GROUP BY ".EmployerCompany::getTableField('country').
                           ";")               
                ->makeSqlQuery();
       // echo $db->getQuery();
        if ($db->getNumRows())
        {
           while ($row=$db->fetchArray())
            {  
                if (!isset($list[$row['country']]))
                   $list[$row['country']]= ucfirst(format_country($row['country']));
            }    
        }
        return $list->asort();
    }
     
}

