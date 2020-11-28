<?php

/*
 * Generated by SuperAdmin Generator date : 25/04/13 23:29:26
 */


class site_currencyInstall extends mfModuleInstall {

     
     
    function execute()
    {        
       $site=$this->getSite();                                  
       $files=array(
              $this->getModelsPath()."/schema.sql",                  
               $this->getDataPath()."/data.sql"              
       );              
       $importDB=importDatabase::getInstance();    
       foreach ($files as $file)
       {    
           if (!is_readable($file))
               continue;
           $importDB->import($file,$site);
           @copy($file, $this->getInstallPath()."/".basename($file));
       }                           
       return true;
    }
    
}