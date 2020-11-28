<?php


class site_shopUninstall extends mfModuleInstall {
    
    
    function execute()
    {
       $importDB=importDatabase::getInstance();      
       $file=$this->getModelsPath()."/drop.sql";
       if (is_readable($file))
           $importDB->import($file);
       return true;
    }
    
}

