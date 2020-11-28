<?php


class site_downgrade_11_Action extends mfModuleUpdate {
 
   
    
    function execute()
    {
        if (mfConfig::getSuperAdmin('site')!=$this->getSite()->get('site_db_name'))
           return ;
     
    }
    
  
}

