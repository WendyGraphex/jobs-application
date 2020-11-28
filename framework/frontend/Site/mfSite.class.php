<?php

class mfSiteFrontEnd extends mfSite {
       
   function getSiteClientQuery()
   { 
      return    "SELECT * FROM ".SiteClient::getTable().
                " WHERE (is_default='YES' OR lang='' OR (lang='%s' AND is_active='YES'))".
                " AND application='frontend' ".
                " AND (params='' OR params='%s')".
                " ORDER BY params desc,lang desc;";
   }
   
   function getSiteQuery()
   {
     return "SELECT site_id,site_db_name,site_frontend_theme as site_theme,site_frontend_available as available,site_type,".
             "logo,picture,".
             "site_master,site_available,site_host,site_db_host,site_db_login,site_db_password,site_access_restricted FROM ".Site::getTable()." WHERE site_host='%s' LIMIT 1;";
   }
     
}


