<?php

/*
 * Generated by SuperAdmin Generator date : 25/03/13 16:38:07
 */
 
class ModuleManagerAdmin extends ModuleManagerAdminBase {
    
    public function getZipName()
    {
        return $this->get('name').".zip";
    }
    
    public function outputZip()
    {          
       $zip=new ZipExtended(mfConfig::get('mf_site_app_cache_dir')."/data/moduleAdmin/".$this->getZipName(),  ZipArchive::CREATE); 
       if (!$zip->open())
          throw new mfException("moduleAdmin ZIP error");
       $zip->addDirectory($this->getCoreDirectory(),$this->getCoreDirectory());    
       $zip->close();
       $zip->output();
    }
    
   function getInstaller($site=null)
   {
       if (!isset($this->installer))
            $this->installer=new moduleUpdater($this->get('name'),$site);     
      return $this->installer;     
   }
}