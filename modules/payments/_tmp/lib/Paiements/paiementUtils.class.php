<?php

class paymentUtils extends paymentUtilsBase {

    
    static function getPositionpayments()
    {
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT * FROM ".payment::getTable()." ORDER BY position ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return null;
        $items=array();
        while ($item=$db->fetchObject('payment'))
        {             
            $item->loadTextI18nStatic();
            $items[]=$item;            
        }            
        return $items;
    }        
    
    static function getpayments()
    {
        $values=array();
        $db=mfSiteDatabase::getInstance()
                ->setParameters()
                ->setQuery("SELECT DISTINCT(module),id FROM ".payment::getTable()." ORDER BY module ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;       
        while ($row=$db->fetchArray())
        { 
            $values[$row['id']]= str_replace("payments_","",$row['module']);               
        }             
        return $values;
    }
 
 }