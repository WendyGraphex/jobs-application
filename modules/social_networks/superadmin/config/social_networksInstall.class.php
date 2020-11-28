<?php

class social_networksInstall extends mfModuleInstall {
     
     function configure()
    {
         $this->schema=array(                    
              array("src"=>"/social-networks","dst"=>"/frontend/view/data/social-networks"), 
            );                
    }
    
    function execute()
    {        
      $site=$this->getSite();                                
       $files=array(
              $this->getModelsPath()."/schema.sql",                  
              $this->getDataPath()."/data.sql",                
              );              
       $importDB=importDatabase::getInstance();    
       foreach ($files as $file)
       {    
           if (!is_readable($file))
               continue;
           $importDB->import($file,$site);
           @copy($file, $this->getInstallPath()."/".basename($file));
       }     
       $this->xcopy();// copie des fichiers dans le site      
       return true;
    }
    
}
