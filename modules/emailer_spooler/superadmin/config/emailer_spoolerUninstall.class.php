<?php


class emailer_spoolerUninstall extends mfModuleInstall {
    
    
    function execute()
    {
       $importDB=importDatabase::getInstance();
       $site=$this->getSite();
       $file=$this->getModelsPath()."/drop.sql";
       if (is_readable($file))
           $importDB->import($file,$site);    
       return true;
    }
    
}

