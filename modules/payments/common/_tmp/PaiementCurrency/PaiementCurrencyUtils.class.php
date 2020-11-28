<?php


class paymentCurrencyUtils {
    
    
    static function getCurrencies($module,$site=null)
    {
         $db=mfSiteDatabase::getInstance()
              ->setParameters(array('module'=>$module))
              ->setQuery("SELECT currency FROM ".paymentCurrency::getTable().
                         " LEFT JOIN ".paymentCurrency::getOuterForJoin('payment_id').
                         " WHERE module='{module}' AND is_active='YES'".
                         ";")
              ->makeSiteSqlQuery($site);         
         if (!$db->getNumRows())
            return array();
        $items=array();
        while ($row=$db->fetchRow())
            $items[]=$row[0];
        return $items;                  
    }
    
}
