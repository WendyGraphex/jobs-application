<?php


class site_elfinderInstall extends mfModuleInstall {
    
    
    function execute()
    {
       $site=$this->getSite();      
       $dir=$site->getDirectory()."/frontend/view/files";
       $dirs=array();
       foreach (array('gallery', 'pictures','video','audio','pdf') as $dir_to_create)
       {
          $dirs[]=$dir."/".$dir_to_create;
       }       
       mfFileSystem::mkdir_multiple($dirs);
       return true;
    }
    
}

