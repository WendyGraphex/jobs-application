<?php


class SystemSite {
   
    protected $site=null;
    
    function __construct() {
        $this->site= mfcontext::getInstance()->getSite()->getSite();
    }
    
    function getSite()
    {
        return $this->site;
    }
    
    function getFolderSize()
    {
        if ($this->folder_size===null)
        {    
            if (mfTools::isWindowsServer())
            {
                $this->folder_size=mfFileSystem::foldersize(mfConfig::get('mf_sites_dir')."/".$this->getSite()->getSiteName());
            }   
            else
            {    
                $this->folder_size=(string)SystemShell::getInstance()->du("-sb ".mfConfig::get('mf_sites_dir')."/".$this->getSite()->getSiteName())                                                                                 
                                                                                       ->getFirst()
                                                                                       ->replace(mfConfig::get('mf_sites_dir')."/".$this->getSite()->getSiteName(),"")
                                                                                       ->trim();
            }
        }
        return $this->folder_size;
    }
    
    function getDatabaseSize()
    {
        if ($this->database_size===null)
        {    
            $this->database_size=0;
            $db=mfSiteDatabase::getInstance() 
                      ->setParameters(array('database'=>$this->getSite()->getSiteName()))
                      ->setQuery("SELECT table_schema 'database', sum(data_length + index_length) as `size` ".
                                 " FROM information_schema.TABLES ".
                                 " WHERE table_schema ='{database}'".
                                 ";")
                      ->makeSqlQuerySuperAdmin();         
             if (!$db->getNumRows())
                     return $this->database_size;
            $row=$db->fetchArray();            
            $this->database_size=$row['size'];            
        }
        return $this->database_size;
    }
}
