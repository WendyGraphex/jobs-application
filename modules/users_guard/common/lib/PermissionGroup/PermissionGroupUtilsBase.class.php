<?php

class PermissionGroupUtilsBase {
    
    static function getPermissionsGroupForI18nSelect()
    {
        $values=array();      
        $lang=  mfcontext::getInstance()->getUser()->getCountry();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>$lang))
                ->setQuery("SELECT ".PermissionGroupI18n::getFieldsAndKeyWithTable()." FROM ".PermissionGroupI18n::getTable().
                           " WHERE lang='{lang}' ORDER BY value ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('PermissionGroupI18n'))
        {            
            $values[$item->get('group_id')]=$item->get('value');
        }             
        return $values;
    }    
    
}    