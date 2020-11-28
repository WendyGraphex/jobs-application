<?php

return array(
    
    "employees_signin"=>array("pattern"=>"/freelancer/signin",
                               "module"=>"employees",
                               "action"=>"signin"),
    
    "employees_forgot_password"=>array("pattern"=>"/freelancer/account/forgot-password","module"=>"employees","action"=>"forgotPassword"),
    
    "employees_forgot_password_confirm"=>array("pattern"=>"/freelancer/account/forgot-password/Confirm","module"=>"employees","action"=>"forgotPasswordConfirm"),
      
    "employees_forgot_password_change"=>array("pattern"=>"/freelancer/account/forgot-password/Change","module"=>"employees","action"=>"forgotPasswordChange"),
   
    
    "employees_account"=>array("pattern"=>'/freelancer/account',
                            "module"=>"employees",
                            "action"=>"account",
                            ),
    
     "employees_account_created"=>array("pattern"=>'/freelancer/account/created',
                            "module"=>"employees",
                            "action"=>"accountCreated",
                            ),       
    
    "employees_logout"=>array("pattern"=>'/freelancer/logout',
                            "module"=>"employees",
                            "action"=>"logout",
                            ),
    
     "employees_login"=>array("pattern"=>'/freelancer/login',
                            "module"=>"employees",
                            "action"=>"login",
                            ),    
    
    "employees"=>array("pattern"=>'/freelancer/admin/{action}',
                            "module"=>"employees",
                            "action"=>"{action}",
                            "requirements"=>array("action"=>".*")),
    
    "employees_ajax"=>array("pattern"=>'/module/freelancer/admin/{action}',
                            "module"=>"employees",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),
   
    "employees_validate_email"=>array("pattern"=>"/freelancer/account/validate",
                            "module"=>"employees",
                            "action"=>"validateEmail"),
    
           
   
      "employees_advert"=>array("pattern"=>'/freelancer/advert/{lang}-{url}-{id}.html',
                            "module"=>"employees",
                            "requirements"=>array("url"=>".*","lang"=>"[a-z][a-z]","id"=>"[0-9]*"),
                            "parameters"=>array('url'=>"{url}","lang"=>"{lang}","id"=>"{id}"),
                            "action"=>"advert",
                            ),
    
     "employees_advert_list"=>array("pattern"=>'/freelancer/adverts',
                            "module"=>"employees",
                            "action"=>"adverts",                         
                        ), 
    
    
     "employees_categories"=>array("pattern"=>'/freelancer/categories',
                            "module"=>"employees",
                            "action"=>"categories",                            
                       ),
    
     "employees_category"=>array("pattern"=>'/freelancer/category/{url}',
                            "module"=>"employees",
                            "action"=>"category",
                            "parameters"=>array('url'=>"/{url}"),
                            "requirements"=>array("url"=>".*")),
    
    
    "employees_employees"=>array("pattern"=>'/freelancers',
                            "module"=>"employees",
                            "action"=>"employees",                            
                       ),
    
    
     "employees_adverts_populars"=>array("pattern"=>'/freelancers/jobs/populars',
                            "module"=>"employees",
                            "action"=>"popularAdverts",                            
                       ),
    
    "employees_adverts_recents"=>array("pattern"=>'/freelancers/jobs/recents',
                            "module"=>"employees",
                            "action"=>"recentAdverts",                            
                       ),
    
     "employees_employee"=>array("pattern"=>'/freelancer/card/{url}.html',
                            "module"=>"employees",
                            "action"=>"employee",
                            "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")),
    
     "employees_test"=>array("pattern"=>'/freelancer/test/{action}',
                            "module"=>"employees",
                            "action"=>"test{action}",
                            "requirements"=>array("action"=>".*")),
    
      "employees_skills_adverts"=>array("pattern"=>'/freelancers/jobs/skills',
                            "module"=>"employees",
                            "action"=>"skillsAdverts",                          
                         ),
    
      "employees_skill_adverts"=>array("pattern"=>'/freelancers/jobs/skill/{skill}',
                            "module"=>"employees",
                            "action"=>"skillAdverts", 
                             "parameters"=>array('skill'=>"{skill}"),
                            "requirements"=>array("skill"=>".*")
                         ),
    
     "employees_employees_skills"=>array("pattern"=>'/freelancers/skills',
                            "module"=>"employees",
                            "action"=>"skillsEmployees",                          
                         ),
    
     "employees_employees_skill"=>array("pattern"=>'/freelancers/skill/{skill}',
                            "module"=>"employees",
                            "action"=>"skillEmployees", 
                             "parameters"=>array('skill'=>"{skill}"),
                            "requirements"=>array("skill"=>".*")
                         ),
    
     "employees_skills"=>array("pattern"=>'/skills',
                            "module"=>"employees",
                            "action"=>"skills",                          
                         ),
    
     "employees_skill"=>array("pattern"=>'/skill/{skill}',
                            "module"=>"employees",
                            "action"=>"skill", 
                             "parameters"=>array('skill'=>"{skill}"),
                            "requirements"=>array("skill"=>".*")
                         ),
    
     "employees_countries"=>array("pattern"=>'/freelancers/countries',
                            "module"=>"employees",
                            "action"=>"countries",                            
                       ),
    
      "employees_cities"=>array("pattern"=>'/freelancers/cities',
                            "module"=>"employees",
                            "action"=>"cities",                            
                       ),
    /* ====================================================================================================== */
    
        "employees_search_country_letter"=>array("pattern"=>'/freelancers/search/country/{letter}',
                            "module"=>"employees",
                            "action"=>"letterCountry",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
       "employees_search_skill_letter"=>array("pattern"=>'/freelancers/skills/{letter}',
                            "module"=>"employees",
                            "action"=>"letterSkill",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
         "employees_search_user_language_letter"=>array("pattern"=>'/freelancers/search/user/language/{letter}',
                            "module"=>"employees",
                            "action"=>"letterUserLanguage",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
    "employees_search_city_letter"=>array("pattern"=>'/freelancers/search/city/{letter}',
                            "module"=>"employees",
                            "action"=>"letterCity",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    /* ======================================================================================================== */
       "employees_search_advert_country_letter"=>array("pattern"=>'/freelancers/jobs/search/country/{letter}',
                            "module"=>"employees",
                            "action"=>"letterAdvertCountry",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
       "employees_search_advert_skill_letter"=>array("pattern"=>'/freelancers/jobs/skill/{letter}',
                            "module"=>"employees",
                            "action"=>"letterAdvertSkill",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
     "employees_search_advert_user_language_letter"=>array("pattern"=>'/freelancers/jobs/user/language/{letter}',
                            "module"=>"employees",
                            "action"=>"letterAdvertUserLanguage",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
     "employees_search_advert_language_letter"=>array("pattern"=>'/freelancers/jobs/language/{letter}',
                            "module"=>"employees",
                            "action"=>"letterAdvertLanguage",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
    "employees_search_advert_city_letter"=>array("pattern"=>'/freelancers/jobs/search/city/{letter}',
                            "module"=>"employees",
                            "action"=>"letterAdvertCity",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
     "employees_search_advert_title_letter"=>array("pattern"=>'/freelancers/jobs/search/title/{letter}',
                            "module"=>"employees",
                            "action"=>"letterAdvertTitle",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
    
      "employees_search_advert_city"=>array("pattern"=>'/freelancers/jobs/search/city/{country}/{city}',
                            "module"=>"employees",
                            "action"=>"advertsCity",
                            "parameters"=>array('city'=>"{city}","country"=>"{country}"),
                            "requirements"=>array("city"=>".*","country"=>".*")),
    
    /*  "employees_search_advert_skill"=>array("pattern"=>'/freelancers/jobs/search/skill/{skill}',
                            "module"=>"employees",
                            "action"=>"advertsSkill",
                            "parameters"=>array('skill'=>"{skill}"),
                            "requirements"=>array("skill"=>".*")),*/
    
     "employees_search"=>array("pattern"=>'/freelancers/jobs/search',
                            "module"=>"employees",
                            "action"=>"searchAdvert",
                          ),
    
     "employees_document_download"=>array("pattern"=>'/freelancers/download/document/{id}/{file}',
                            "module"=>"employees",
                            "action"=>"downloadDocument",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*")
                          ),
    
     "employees_document_download_picture"=>array("pattern"=>'/freelancers/download/document/pictures/{id}/{type}/{file}',
                            "module"=>"employees",
                            "action"=>"downloadDocumentPicture",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}","type"=>"{type}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*","type"=>"small|medium|thumb")
                          ),
);

