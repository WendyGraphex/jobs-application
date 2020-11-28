<?php

class paymentUtilsBase  {
        
    
    static function loadpaymentsTextI18n($site=null)
    {       
        $db=mfSiteDatabase::getInstance()                
                ->setParameters(array())
                ->setQuery("SELECT module FROM ".payment::getTable().";")               
                ->makeSiteSqlQuery($site); 
        if (!$db->getNumRows())
            return array();          
        if (($i18n=  mfcontext::getInstance()->getI18n()))
        {                 
            while ($row=$db->fetchArray())
            {                                                
                 $i18n->addModuleMessageSource($row['module']);            
            } 
        }        
    }
       
 
 }