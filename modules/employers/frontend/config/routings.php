<?php

return array(

  
    
    "employers_signin"=>array("pattern"=>"/employer/signin",
                               "module"=>"employers",
                               "action"=>"signin"),
    
    "employers_forgot_password"=>array("pattern"=>"/employer/account/forgot-password","module"=>"employers","action"=>"forgotPassword"),
    
    "employers_forgot_password_confirm"=>array("pattern"=>"/employer/account/forgotPassword/Confirm","module"=>"employers","action"=>"forgotPasswordConfirm"),
      
    "employers_forgot_password_change"=>array("pattern"=>"/employer/account/forgot-password/Change","module"=>"employers","action"=>"forgotPasswordChange"),
   
    
    "employers_account"=>array("pattern"=>'/employer/account',
                            "module"=>"employers",
                            "action"=>"account",
                            ),
    
     "employers_account_created"=>array("pattern"=>'/employer/account/created',
                            "module"=>"employers",
                            "action"=>"accountCreated",
                            ),       
    
    "employers_logout"=>array("pattern"=>'/employer/logout',
                            "module"=>"employers",
                            "action"=>"logout",
                            ),
    
     "employers_login"=>array("pattern"=>'/employer/login',
                            "module"=>"employers",
                            "action"=>"login",
                            ),    
    
    "employers"=>array("pattern"=>'/employer/admin/{action}',
                            "module"=>"employers",
                            "action"=>"{action}",
                            "requirements"=>array("action"=>".*")),
    
    "employers_ajax"=>array("pattern"=>'/module/employer/admin/{action}',
                            "module"=>"employers",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),
   
  "employers_validate_email"=>array("pattern"=>"/employer/account/validate",
                            "module"=>"employers",
                            "action"=>"validateEmail"),
    
   

  /*  "employers_postjob"=>array("pattern"=>'/employer/post-mission',
                            "module"=>"employers",
                            "action"=>"postMission",
                            ),*/
    
    "employers_advert"=>array("pattern"=>'/employer/job/{lang}-{url}-{id}.html',
                            "module"=>"employers",
                            "requirements"=>array("url"=>".*","lang"=>"[a-z][a-z]","id"=>"[0-9]*"),
                            "parameters"=>array('url'=>"{url}","lang"=>"{lang}","id"=>"{id}"),
                            "action"=>"advert",
                            ),
    
     "employers_advert_list"=>array("pattern"=>'/employer/jobs',
                            "module"=>"employers",
                            "action"=>"adverts",                         
                        ), 
    
    "employers_list"=>array("pattern"=>'/employer/list',
                            "module"=>"employers",
                            "action"=>"list",                         
                        ),       
     
    "employers_categories"=>array("pattern"=>'/employer/categories',
                            "module"=>"employers",
                            "action"=>"categories",                            
                       ),
    
    "employers_employer404"=>array("pattern"=>'/employer/employer404',
                            "module"=>"employers",
                            "action"=>"employer404",                            
                       ),
    
     "employers_category"=>array("pattern"=>'/employer/category/{url}',
                            "module"=>"employers",
                            "action"=>"category",
                            "parameters"=>array('url'=>"/{url}"),
                            "requirements"=>array("url"=>".*")),
    
    
     "employers_employers"=>array("pattern"=>'/employers',
                            "module"=>"employers",
                            "action"=>"employers",                            
                       ),
    
      "employers_adverts_populars"=>array("pattern"=>'/employers/jobs/populars',
                            "module"=>"employers",
                            "action"=>"popularAdverts",                            
                       ),
    
    "employers_adverts_recents"=>array("pattern"=>'/employers/jobs/recents',
                            "module"=>"employers",
                            "action"=>"recentAdverts",                            
                       ),
    
     "employers_employer"=>array("pattern"=>'/employer/card/{url}.html',
                            "module"=>"employers",
                            "action"=>"employer",
                            "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")),
    
    "employers_company"=>array("pattern"=>'/employer/company/graphex/{url}-{id}.html',
                            "module"=>"employers",
                            "action"=>"company",
                            "parameters"=>array('url'=>"{url}","id"=>"{id}"),
                            "requirements"=>array("url"=>".*","id"=>"[0-9]*")),
    
     "employers_companies"=>array("pattern"=>'/employer/companies',
                            "module"=>"employers",
                            "action"=>"companies",                            
                       ),        
    
      "employers_countries"=>array("pattern"=>'/employers/jobs/countries',
                            "module"=>"employers",
                            "action"=>"countries",                            
                       ),
    
      "employers_cities"=>array("pattern"=>'/employers/jobs/cities',
                            "module"=>"employers",
                            "action"=>"cities",                            
                       ),
   /* ====================================================================================================== */
    
        "employers_search_country_letter"=>array("pattern"=>'/employers/search/country/{letter}',
                            "module"=>"employers",
                            "action"=>"letterCountry",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
        
         "employers_search_user_language_letter"=>array("pattern"=>'/employers/search/user/language/{letter}',
                            "module"=>"employers",
                            "action"=>"letterUserLanguage",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
    "employers_search_city_letter"=>array("pattern"=>'/employers/search/city/{letter}',
                            "module"=>"employers",
                            "action"=>"letterCity",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    /* ======================================================================================================== */
       "employers_search_advert_country_letter"=>array("pattern"=>'/employers/jobs/search/country/{letter}',
                            "module"=>"employers",
                            "action"=>"letterAdvertCountry",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),        
    
     "employers_search_advert_user_language_letter"=>array("pattern"=>'/employers/jobs/user/language/{letter}',
                            "module"=>"employers",
                            "action"=>"letterAdvertUserLanguage",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
     "employers_search_advert_language_letter"=>array("pattern"=>'/employers/jobs/language/{letter}',
                            "module"=>"employers",
                            "action"=>"letterAdvertLanguage",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
    "employers_search_advert_city_letter"=>array("pattern"=>'/employers/jobs/search/city/{letter}',
                            "module"=>"employers",
                            "action"=>"letterAdvertCity",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
     "employers_search_advert_title_letter"=>array("pattern"=>'/employers/jobs/search/title/{letter}',
                            "module"=>"employers",
                            "action"=>"letterAdvertTitle",
                            "parameters"=>array('letter'=>"{letter}"),
                            "requirements"=>array("letter"=>"[A-Z]?")),
    
     
      "employers_search_advert_city"=>array("pattern"=>'/employers/jobs/search/city/{country}/{city}',
                            "module"=>"employers",
                            "action"=>"advertsCity",
                            "parameters"=>array('city'=>"{city}","country"=>"{country}"),
                            "requirements"=>array("city"=>".*","country"=>".*")),
    
      "employers_search"=>array("pattern"=>'/employers/jobs/search',
                            "module"=>"employers",
                            "action"=>"searchAdvert",
                          ),
    
     "employers_document_download"=>array("pattern"=>'/employers/download/document/{id}/{file}',
                            "module"=>"employers",
                            "action"=>"downloadDocument",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*")
                          ),
    
     "employers_document_download_picture"=>array("pattern"=>'/employers/download/document/pictures/{id}/{type}/{file}',
                            "module"=>"employers",
                            "action"=>"downloadDocumentPicture",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}","type"=>"{type}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*","type"=>"small|medium|thumb")
                          ),
);

