<?php

return array(
     "config/autoloadSite.php"      =>  array("class"=>"mfAutoloadConfigHandler"),
     "config/factories.php"         =>  array("class"=>"mfFactoryConfigHandler"),
     "config/routings.php"          =>  array("class"=>"mfRoutingConfigHandler"),
     "config/rewriting.php"         =>  array("class"=>"mfRewriteConfigHandler"),
     "config/events.php"            =>  array("class"=>"mfEventsConfigHandler"),
     "config/settings.php"          =>  array("class"=>"mfSettingsConfigHandler",
                                              "param"=>array("prefix"=>"mf_")
                                            ),
     "module/*/config/view.php"     =>  array("class"=>"mfViewConfigHandler",
                                              "param"=>array("prefix"=>"view_")
                                           ), 
     "module/*/config/cache.php"    =>  array("class"=>"mfCacheConfigHandler",
                                           // "param"=>array("prefix"=>"cache_")
                                           ), 
     "module/*/config/module.php"   =>  array("class"=>"mfModuleConfigHandler",
                                            "param"=>array("prefix"=>"mod_")
                                           ), 
     "module/*/config/block.php"   =>  array("class"=>"mfBlockConfigHandler",
                                            "param"=>array("prefix"=>"block_")
                                           ), 
    
     "module/*/config/security.php" =>  array("class"=>"mfSecurityConfigHandler",
                                           ), 
     
     "config/filters.php"  =>  array("class"=>"mfFilterConfigHandler",
                                           ), 
   //  "module/*/config/filters.php"  =>  array("class"=>"mfFilterConfigHandler",
   //                                        ), 
         
     "config/actions.php"  =>  array("class"=>"mfActionsConfigHandler"),
    
     "module/*/config/autoload_local.php" =>  array("class"=>"mfAutoloadModuleConfigHandler",
             
  //   "config/nodejs.php"        =>  array("class"=>"mfXNodeJsConfigHandler"),    
                                           ),        
);
