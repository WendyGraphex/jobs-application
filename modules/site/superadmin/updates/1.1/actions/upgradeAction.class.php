<?php


class site_upgrade_11_Action extends mfModuleUpdate {
 
   
    function execute()
    {
        if (mfConfig::getSuperAdmin('site')!=$this->getSite()->get('site_db_name'))
           return ;     
       $site=$this->getSite();     
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

