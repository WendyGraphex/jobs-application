<?php

class UtilsNodeJsSettings extends SystemNodeJsServer {
    
     protected static $instance=null;    
                            
     function getDirectory()
     {
         return mfConfig::get('mf_modules_dir')."/utils_nodejs/common/nodeJs";
     }
     
     function getProgram()
     {
         return 'server.js';
     }
     
    function getDefaults() {
         parent::getDefaults();
         $this->add(array(
             'debug'=>'YES',
             'port'=>null,
             'protocol'=>'https'
           //  'site_db_name'=>$this->getSite()->get('site_db_name')
         )); 
    }
    
     

}
