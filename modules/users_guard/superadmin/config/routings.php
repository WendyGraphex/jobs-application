<?php

return array(
    "users_guard_logout"=>array("pattern"=>'/logout',"module"=>"users_guard","action"=>"logout"),
    "users_guard_ajax"=>array("pattern"=>'/module/users/guard/admin/{action}',"module"=>"users_guard","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
    
    "users_guard_site_ajax"=>array("pattern"=>'/module/site/users/guard/admin/{action}',"module"=>"users_guard","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
  //  "users_guard_dashboard_list"=>array("pattern"=>'/crons{root}',"module"=>"users_guard","action"=>"list","requirements"=>array("root"=>"/?")),
  //  "users_guard_dashboard_permissions"=>array("pattern"=>"/dashboard/permissions","module"=>"users_guard","action"=>"dashboardPermissionsList"),  
  //  "users_guard_dashboard_permissions_ajax"=>array("pattern"=>'/module/dashboard/permissions/{action}',"module"=>"users_guard","action"=>"ajaxDashboardPermissions{action}","requirements"=>array("action"=>"(.*)?")),
  //  "users_guard_dashboard_groups"=>array("pattern"=>"/dashboard/groups","module"=>"users_guard","action"=>"dashboardGroupsList"),  
  //  "users_guard_dashboard_groups_ajax"=>array("pattern"=>'/module/dashboard/groups/{action}',"module"=>"users_guard","action"=>"ajaxDashboardGroups{action}","requirements"=>array("action"=>"(.*)?")),
  //  "users_guard_dashboard_connexions"=>array("pattern"=>"/dashboard/connexions","module"=>"users_guard","action"=>"dashboardConnexionsList"),  
  //  "users_guard_dashboard_connexions_ajax"=>array("pattern"=>'/module/dashboard/connexions/{action}',"module"=>"users_guard","action"=>"ajaxDashboardConnexions{action}","requirements"=>array("action"=>"(.*)?")),
  //  "users_guard_ajax"=>array("pattern"=>'/module/cron/{action}',"module"=>"users_guard","action"=>"ajax{action}","requirements"=>array("action"=>"(.*)?")),
  //  "users_guard_site_permissions"=>array("pattern"=>"/permissions","module"=>"users_guard","action"=>"permissionsList"),  
  //  "users_guard_site_permissions_ajax"=>array("pattern"=>'/module/permissions/{action}',"module"=>"users_guard","action"=>"ajaxPermissions{action}","requirements"=>array("action"=>"(.*)?")),
  //  "users_guard_site_groups"=>array("pattern"=>"/groups","module"=>"users_guard","action"=>"groupsList"),  
  //  "users_guard_site_groups_ajax"=>array("pattern"=>'/module/groups/{action}',"module"=>"users_guard","action"=>"ajaxGroups{action}","requirements"=>array("action"=>"(.*)?")),
  //  "users_guard_site_connexions_ajax"=>array("pattern"=>'/module/connexions/{action}',"module"=>"users_guard","action"=>"ajaxConnexions{action}","requirements"=>array("action"=>"(.*)?")),
    "users_guard_restrictive_user_access_file"=>array(
                                    "pattern"=>'/restrictive/{site_and_application}data/users/{user}/{file}',
                                    "requirements"=>array("site"=>"([a-z0-9-]+\.)+[a-z]{2,6}" , //".*",
                                                          "application"=>"admin|frontend",
                                                          "user"=>"[0-9]*",
                                                          "file"=>".*",
                                                          "site_and_application"=>"({site}/{application}/)?"
                                                         ),
                                    "module"=>"users_guard",
                                    "defaults"=>array("site_and_application"=>""),
                                    "action"=>"restrictiveAccessFile",
                                    "parameters"=>array("site"=>"{site}","application"=>"{application}","user"=>"{user}","file"=>"{file}","path"=>"data/users/{user}/{file}")
                                )
);

/*
return array(
 //ok   "userguard_logout"=>array("pattern"=>"#^/logout$#","module"=>"users_guard","action"=>"logout"),
 //ok   "userguard_dashboard_permission"=>array("pattern"=>"#^/dashboard/permissions$#","module"=>"users_guard","action"=>"dashboardPermissionsList"),    
 //ok   "userguard_dashboard_permission_ajax"=>array("pattern"=>'#^/module/dashboard/permissions/(.*)?$#',"module"=>"users_guard","action"=>"ajaxDashboardPermissions\\1"),
 //ok   "userguard_site_permission"=>array("pattern"=>"#^/permissions$#","module"=>"users_guard","action"=>"permissionsList"),
 //ok   "userguard_site_permission_ajax"=>array("pattern"=>'#^/module/permissions/(.*)?$#',"module"=>"users_guard","action"=>"ajaxPermissions\\1"),
 //ok   "userguard_dashboard_group"=>array("pattern"=>"#^/dashboard/groups$#","module"=>"users_guard","action"=>"dashboardGroupsList"),    
 //ok   "userguard_dashboard_group_ajax"=>array("pattern"=>'#^/module/dashboard/groups/(.*)?$#',"module"=>"users_guard","action"=>"ajaxDashboardGroups\\1"),
 //ok   "userguard_site_group"=>array("pattern"=>"#^/groups$#","module"=>"users_guard","action"=>"groupsList"),    
 //ok   "userguard_site_group_ajax"=>array("pattern"=>'#^/module/groups/(.*)?$#',"module"=>"users_guard","action"=>"ajaxGroups\\1"),
 //ok   "userguard_dashboard_connexions"=>array("pattern"=>"#^/dashboard/connexions$#","module"=>"users_guard","action"=>"dashboardConnexionsList"),
 //ok   "userguard_dashboard_connexions_ajax"=>array("pattern"=>"#^/module/dashboard/connexions/(.*)?$#","module"=>"users_guard","action"=>"ajaxDashboardConnexions\\1"),
 //ok   "userguard_site_connexions_ajax"=>array("pattern"=>"#^/module/connexions/(.*)?$#","module"=>"users_guard","action"=>"ajaxConnexions\\1"),
    //"userguard_restrictive_user_access_file"=>array("pattern"=>'#^/restrictive(/data/users/(.*)/(.*))?$#',"module"=>"users_guard","action"=>"restrictiveAccessFile","parameters"=>array("path"=>"\\1","user"=>"\\2","file"=>"\\3")),    
    //"userguard_restrictive_user_access_file"=>array("pattern"=>'#^/restrictive/(admin/|frontend/)?(data/users/(.*)/(.*))?$#',"module"=>"users_guard","action"=>"restrictiveAccessFile","parameters"=>array("application"=>"\\1","path"=>"\\2","user"=>"\\3","file"=>"\\4")),    
 //OK   "userguard_restrictive_user_access_file"=>array("pattern"=>'#^/restrictive/((.*)/((admin|frontend)/))?(data/users/(.*)/(.*))?$#',"module"=>"users_guard","action"=>"restrictiveAccessFile","parameters"=>array("site"=>"\\2","application"=>"\\4","path"=>"\\5","user"=>"\\6","file"=>"\\7")),    
    
);*/