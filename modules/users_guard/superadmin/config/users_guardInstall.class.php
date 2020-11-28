<?php


class users_guardInstall extends mfModuleInstall {

    function execute()
    {       
       $files=array(
           $this->getModelsPath()."/schema.sql",  
           $this->getDataPath()."/data_superadmin.sql"
       );              
       foreach ($files as $file)
       {    
           if (!is_readable($file))
               continue;
           ImportDatabase::getInstance()->import($file);
           @copy($file, $this->getInstallPath()."/".basename($file));
       }
       return true;
    }
    
}

