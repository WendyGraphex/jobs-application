<?php


class emailer_spooler_upgrade_10_Action extends mfModuleUpdate {
 
    function execute()
    {      
       $site=$this->getSite();     
       if (mfConfig::getSuperAdmin('site')!=$site->get('site_db_name'))                 
           return ;      
       $files=array(
              $this->getModelsPath()."/upgrade.sql",               
              );              
       $importDB=importDatabase::getInstance();           
       foreach ($files as $file)
       {    
           if (!is_readable($file))
               continue;          
           $importDB->import($file,$site);
           @copy($file, $this->getUpdateDirectory()."/".basename($file));
       }    
       
    }
}

