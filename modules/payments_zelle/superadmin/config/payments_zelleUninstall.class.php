<?php


class payments_zelleUninstall extends mfModuleInstall {
    
    
    function execute()
    {
       $importDB=importDatabase::getInstance();
       $site=$this->getSite();
       $file=$this->getModelsPath()."/drop.sql";
       if (is_readable($file))
           $importDB->import($file,$site);
       $method= new PaymentMethod('zelle'); 
       $method->unregister();
       
       return true;
    }
    
}

