<?php


class payments_withdrawalUninstall extends mfModuleInstall {
    
    
    function execute()
    {
       $importDB=importDatabase::getInstance();
       $site=$this->getSite();
       $file=$this->getModelsPath()."/drop.sql";
       if (is_readable($file))
           $importDB->import($file,$site);
       $method= new PaymentMethod('withdrawal'); 
       $method->unregister();
       
       return true;
    }
    
}

