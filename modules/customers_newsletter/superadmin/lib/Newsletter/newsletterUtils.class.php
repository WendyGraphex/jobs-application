<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of newsletterUtils
 *
 * @author fred
 */
class newsletterUtils {
    
    
    static function getNewsletters($site=null)
    {
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT id,email,updated_at,created_at FROM t_newsletter;")               
                ->makeSqlQuery(null,$site); 
        if (!$db->getNumRows())
            return null;
        $newsletters=array();
        while ($newsletter=$db->fetchObject('newsletter'))
        { 
            $newsletters[]=$newsletter;
        }            
        return $newsletters;
    }
}

