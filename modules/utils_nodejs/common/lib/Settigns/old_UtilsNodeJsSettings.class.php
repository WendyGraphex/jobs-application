<?php


class old_UtilsNodeJsSettings extends mfSettingsBase {

     protected static $instance=null;
     
     function __construct($data=null,$site=null)
     {
         parent::__construct($data,null,'frontend',$site);
     } 
      
     function getDefaults()
     {   
         $this->add(array(
                            'host'=>'ws://127.0.0.1:8088',
                            'stun'=>'stun:stun.l.google.com:19302', 
                            'debug'=>'NO', 
                            'port'=>'8088',                            
                            //internal
                            'pid'=>null
             ));
        
     }  
}
