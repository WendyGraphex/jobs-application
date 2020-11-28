<?php


class employers_alertInstall extends mfModuleInstall {

    function execute()
    {            
       $files=array(
            $this->getModelsPath()."/schema.sql",
           $this->getDataPath()."/data.sql"
       );
       $importDB=ImportDatabase::getInstance();
       foreach ($files as $file)
       {    
           if (!is_readable($file))
               continue;
           $importDB->import($file);
           @copy($file, $this->getInstallPath()."/".basename($file));
       }
       return true;
    }
    
}