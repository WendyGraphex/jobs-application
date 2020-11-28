<?php
 

class CmsPageSettingsBase extends mfSettingsBase {        
     
     protected static $instance=null;
               
     function __construct($data=null)
     {
         parent::__construct($data,null,'frontend');
     } 
          
         
}
