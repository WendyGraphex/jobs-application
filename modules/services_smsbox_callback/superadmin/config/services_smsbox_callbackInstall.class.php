<?php


class services_smsbox_callbackInstall extends mfModuleInstall {
    
    
    function execute()
    {
        $site=$this->getSite();    
        $files=array(
            $this->getModelsPath()."/schema.sql",           
        );
        if (mfConfig::getSuperAdmin('site')!=$site->get('site_db_name'))                  
           $files[]= $this->getModelsPath()."/schema_superadmin.sql";
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

