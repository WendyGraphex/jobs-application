<?php
 

class CmsPageSettings extends CmsPageSettingsBase {
        
      
     function getDefaults()
     {   
         $this->add(array(               
                /* Sitemap */
                "site_map_changefreq"=>"weekly",
                "site_map_priority"=>"0.8",
             
              ));        
     }
     
    
         
}
