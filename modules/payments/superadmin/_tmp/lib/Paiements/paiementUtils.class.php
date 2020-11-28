<?php

class paymentUtils extends paymentUtilsBase {

    
    static function getPositionpayments($site=null)
    {
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT * FROM ".payment::getTable()." ORDER BY position ASC;")               
                ->makeSiteSqlQuery($site); 
        if (!$db->getNumRows())
            return null;
        $items=array();
        while ($item=$db->fetchObject('payment'))
        { 
            $item->site=$site;
            $item->loadTextI18nStatic();
            $items[]=$item;            
        }            
        return $items;
    }        
    
    static function getpayments($site=null)
    {
        $values=array();
        $db=mfSiteDatabase::getInstance()
                ->setParameters()
                ->setQuery("SELECT DISTINCT(module),id FROM ".payment::getTable()." ORDER BY module ASC;")               
                ->makeSiteSqlQuery($site); 
        if (!$db->getNumRows())
            return $values;       
        while ($row=$db->fetchArray())
        { 
            $values[$row['id']]= str_replace("payments_","",$row['module']);               
        }             
        return $values;
    }
 
 }