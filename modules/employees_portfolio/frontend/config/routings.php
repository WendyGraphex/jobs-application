<?php

return array(
    
    
    "employees_portfolio_ajax"=>array("pattern"=>'/module/employee/portfolio/admin/{action}',
                            "module"=>"employees_portfolio",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),
   
     "employees_portfolio_download"=>array("pattern"=>'/employee/{employee}/portfolio/files/{file}',
        "module"=>"employees_portfolio",
        "action"=>"download",
        "requirements" => array(         
            "file" => ".*","employee"=>".*"       
        ),
         "parameters" => array("file"=>"{file}","employee"=>"{employee}")
     ),
    
    
    "employees_portfolio_pictures_download"=>array("pattern"=>'/employee/{employee}/portfolio/pictures/{type}/{file}',
        "module"=>"employees_portfolio",
        "action"=>"downloadPictures",
        "requirements" => array(         
            "file" => ".*",
            "employee"=>".*",
            "type" => "thumb|medium|small|original",          
        ),
         "parameters" => array("file"=>"{file}","type"=>"{type}","employee"=>"{employee}")
     ),
    
    
     "employers_portfolio_page"=>array("pattern"=>'/employee/portfolio/{url}',
                            "module"=>"employees_portfolio",
                            "action"=>"portfolio",
                            "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*"),
         ),
);

