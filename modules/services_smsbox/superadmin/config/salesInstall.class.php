<?php

class salesInstall extends mfModuleInstall {

    function execute()
    {
       $files = array(
           $this->getModelsPath() . "/schema.sql",
          // $this->getDataPath() . "/data.sql"
       );
       $importDB = importDatabase::getInstance();
       foreach ($files as $file) {
           if (!is_readable($file))
               continue;
           $importDB->import($file);
           @copy($file, $this->getInstallPath() . "/" . basename($file));
       }
       return true;
    }

}

