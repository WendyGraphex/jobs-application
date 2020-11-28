<?php


class EmployerCompanyUtils extends EmployerCompanyUtilsBase {
    
        
        static function getFormattedCountriesForSelect()
    {
        $list=new mfArray();   
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT ".EmployerCompany::getTableField('country')." FROM ".EmployerCompany::getTable().                          
                            " WHERE ".EmployerCompany::getTableField('is_active')."='YES' ". 
                                " AND ".EmployerCompany::getTableField('is_validated')."='YES'".                             
                                " AND ".EmployerCompany::getTableField('is_completed')."='YES'". 
                           " GROUP BY ".EmployerCompany::getTableField('country').                          
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
}

