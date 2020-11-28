<?php

 
class paymentUtils extends  paymentUtilsBase {        
    
    static function getListpayments()
    {
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT * FROM ".payment::getTable()." WHERE is_active='YES' ORDER by position ASC;")               
                ->makeSiteSqlQuery(); 
        if (!$db->getNumRows())
            return null;
        $items=new paymentCollection();
        while ($row=$db->fetchObject('payment'))
            $items[]=$row->loaded();                  
        return $items;
    }
                                                                               
}
