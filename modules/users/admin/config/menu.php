<?php

return array(

    "menu" => array(
        "dashboard" => array(
            "childs" => array('7000_users_admin' => '',
                           //   '050_users_speciality_admin' => '',
                           //   "060_users_real_speciality_admin" =>'',
                           //   "070_users_profession_admin" => ''
                        ),
        ),
    ),

    "items" => array(

        "7000_users_admin" => array(
            "title" => "Users",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
             "route_ajax" => array('users_ajax' => array('action' => 'ListUser')),
            "childs" => array(
                "00_users.admin" => '',
               // "90_users.sessions.admin" =>''),
                "20_users.grpups.admin" => '',
                "30_users.permissions.admin" => ''),
            "enabled" => true,
        ),
        
      /*   "050_users_speciality_admin" => array(
            "title" => "Specialties",
            "icon_awe" => "fa-stethoscope",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
             "route_ajax" => array('users_ajax' => array('action' => 'ListSpeciality')),
            "childs" => array(
                "00_users.admin" => ''),
               // "90_users.sessions.admin" =>''),
            "enabled" => true,
        ),*/
        
        
       /*    "060_users_real_speciality_admin" => array(
            "title" => "Real Specialities",
            "icon_awe" => "fa-stethoscope",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
             "route_ajax" => array('users_ajax' => array('action' => 'ListRealSpeciality')),
         //   "childs" => array("00_users.admin" => ''),
            "enabled" => true,
        ),*/

       /*    "070_users_profession_admin" => array(
            "title" => "Professions",
            "icon_awe" => "fa-briefcase",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
             "route_ajax" => array('users_ajax' => array('action' => 'ListProfession')),
            "childs" => array("00_users.admin" => ''),
            "enabled" => true,
        ),*/
        "00_users.admin" => array(
            "title" => "Accounts",
            "icon_awe" => "fa-user",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('users_ajax' => array('action' => 'ListUser')),
            "enabled" => true,
        ),

       /* "90_users.sessions.admin" => array(
            "title" => "Connections",
            "icon_awe" => "fa-user",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('users_ajax' => array('action' => 'ListSession')),
            "enabled" => true,
        ),*/
       

        

    ),

    
);
