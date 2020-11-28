<?php


class SaleTaxUtilsBase {
  
    
    static function getTaxesForSelect()
    {
        $list=new mfArray();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("SELECT * FROM ".SaleTax::getTable()." ORDER BY rate ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return  $list;
        while ($tax=$db->fetchObject('SaleTax'))
        {
           $list[$tax->get('id')]=  format_pourcentage($tax->get('rate'));
        }     
        return $list;
    } 
    
    static function getTaxes()
    {
        $list=new mfArray();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("SELECT * FROM ".SaleTax::getTable()." ORDER BY rate ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $list;        
        while ($tax=$db->fetchObject('SaleTax'))
        {
           $list[$tax->get('id')]=  $tax->loaded();
        }     
        return $list;
    } 
    
    
   /* static function getCollectionById($taxes)
    {
        $collection=new SaleTaxCollection();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("SELECT * FROM ".SaleTax::getTable().
                           " WHERE id IN('".implode("','",$taxes)."')".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $collection;        
        while ($tax=$db->fetchObject('SaleTax'))
        {
           $collection[$tax->get('id')]=  $tax->loaded();
        }     
        return $collection;
    } */
    
   
}

