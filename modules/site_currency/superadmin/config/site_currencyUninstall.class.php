<?php

/*
 * Generated by SuperAdmin Generator date : 25/04/13 23:29:26
 */

class site_currencyUninstall extends mfModuleInstall {
    
    function execute()
    {
       
       $importDB=importDatabase::getInstance();
       $site=$this->getSite();
       $files=array(
                   $this->getModelsPath()."/drop.sql",                
                   );
              
       foreach ($files as $file)
       {             
         if (is_readable($file))
            $importDB->import($file,$site);
       }       
       return true;
    }
    
}


