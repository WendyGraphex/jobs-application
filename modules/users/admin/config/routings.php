<?php

return array(
   // "users_list"=>array("pattern"=>'/users',"module"=>"users","action"=>"List"),
   // "users_export"=>array("pattern"=>'/users/export',"module"=>"users","action"=>"export"),
   // "users_ajax"=>array("pattern"=>'/module/users/{action}',"module"=>"users","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
       "users_ajax"=>array("pattern"=>'/module/site/users/admin/{action}',"module"=>"users","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
       "users_restrictive_access_file"=>array(
                                    "pattern"=>'/restrictive/data/users/{file}',
                                    "requirements"=>array("file"=>".*",                                                          
                                                         ),
                                    "module"=>"users",                                   
                                    "action"=>"restrictiveAccessFile",
                                    "parameters"=>array("file"=>"{file}")
                                )
);

