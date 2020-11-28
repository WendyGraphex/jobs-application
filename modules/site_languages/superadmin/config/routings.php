<?php

return array(     
        "languages_dashboard_list"=>array("pattern"=>'/dashboard/languages',"module"=>"languages","action"=>"dashboardList"),
        "languages_dashboard_ajax"=>array("pattern"=>'/module/dashboard/languages/{action}',"module"=>"languages","action"=>"ajaxDashboard{action}","requirements"=>array("action"=>".*")),
    
);

