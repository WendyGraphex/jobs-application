<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
      'ajaxListEmployer'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialEmployer'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     "ajaxNewEmployer"=>array(
                 'helpers'=>array("number"=>null),      
                 'functions'=>array('html_options_format'=>''),
                 'widgets'=>array('select_country'=>''), 
           
     ),
     
      "ajaxViewEmployer"=>array(
                 'helpers'=>array("number"=>null),      
                 'functions'=>array('html_options_format'=>''),
                 'widgets'=>array('select_country'=>''), 
                
     ),
     
     
      "ajaxSaveEmployer"=>array(
                 'template'=>'recruiters_ajaxViewRecruiter.tpl',
                 'helpers'=>array("number"=>null),      
                 'functions'=>array('html_options_format'=>''),
                 'widgets'=>array('select_country'=>''), 
               
     ),
              
        "ajaxSaveCreatePasswordUser"=>array(
                    "template"=>"employers_ajaxCreatePasswordUser.tpl"
     ),
     
     
       
     /* ======================== T Y P E ================================================= */
     
      'ajaxSaveNewTypeI18n'=>array(
                                    'template'=>"employers_ajaxNewTypeI18n.tpl",  
      ), 
     
      'ajaxSaveTypeI18n'=>array(
                                    'template'=>"employers_ajaxViewTypeI18n.tpl",  
      ), 
     
      /* ======================== L E V E L ================================================= */
     'ajaxListLevel'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialLevel'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxSaveNewLevelI18n'=>array(
                                    'template'=>"employers_ajaxNewLevelI18n.tpl",  
      ), 
     
      'ajaxSaveLevelI18n'=>array(
                                    'template'=>"employers_ajaxViewLevelI18n.tpl",  
      ), 
     
       /*======================================  C O N T A C T ===================================================*/
      'ajaxListContact'=>array( 
                                       
                                    'helpers'=>array('date'=>null),
                        "security"=>array("php_functions"=>array(                                                                                          
                                           "format_date"=>null
                                                ),
                               ),
          ), 
     
      'ajaxListPartialContact'=>array(
                           
                              
                           'helpers'=>array('date'=>null),
          "security"=>array("php_functions"=>array(                                                                                          
                                           "format_date"=>null
                                                ),
           
                            ),
        ), 
      /*======================================  S E S S I O N ===================================================*/
     
       'ajaxListSession'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialSession'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
    /* ====================== C O M P A N Y ==================================== */
     
      "ajaxNewCompany"=>array(
              'widgets'=>array('select_country'=>''),             
     ),
     
     "ajaxViewCompany"=>array(
              'widgets'=>array('select_country'=>''),               
     ),
     
     "ajaxSaveCompany"=>array(
              'widgets'=>array('select_country'=>''),      
              'template'=>'employers_ajaxViewCompany.tpl'
    ),
     
    'ajaxListPartialUserForCompany'=>array(
             'helpers'=>array('date'=>null),
    ),
     'ajaxListPartialCompany'=>array(
                         
                           'helpers'=>array('date'=>null),
          "security"=>array("php_functions"=>array(                                                                                          
                                           "format_date"=>null
                                                ),
                               ),
                           ),
    'ajaxListCompany'=>array(
                           
                           'helpers'=>array('date'=>null),
          "security"=>array("php_functions"=>array(                                                                                          
                                           "format_date"=>null
                                                ),
                               ),
                           ),
    
    /* =========================== G A L L E R Y ================================ */
      "ajaxListGallery"=>array(
          'helpers'=>array('date'=>null),
           
      ),
     
      "ajaxListPartialGallery"=>array(
          'helpers'=>array('date'=>null),
           
      ),
     
     "ajaxSaveGallery"=>array(
       "template"=>"employers_ajaxViewGallery.tpl"  
     ),  
         
     "ajaxSaveNewGalleryI18n"=>array(
         "template"=>"employers_ajaxNewGalleryI18n.tpl"
     ),
     
     "ajaxSaveGalleryI18n"=>array(
         "template"=>"employers_ajaxViewGalleryI18n.tpl"
     ),

     /* =========================== C I T Y ==================================================================== */
      "ajaxListCity"=>array(
          'helpers'=>array('date'=>null)
      ),
     
      "ajaxListPartialCity"=>array(
          'helpers'=>array('date'=>null)
      ),
        
     "ajaxSaveNewCityI18n"=>array(
         'template'=>'employers_ajaxNewCityI18n.tpl'
     ),
     
     "ajaxSaveCityI18n"=>array(
         "template"=>"employers_ajaxViewCityI18n.tpl"
     ),

      /* ======================== U N I T ================================================= */
      'ajaxListPartialUnit'=>array(
                           
                           'helpers'=>array('date'=>null),
          "security"=>array("php_functions"=>array(                                                                                          
                                           "format_date"=>null
                                                ),
                               ),
                           ),
    'ajaxListUnit'=>array(
                           
                           'helpers'=>array('date'=>null),
          "security"=>array("php_functions"=>array(                                                                                          
                                           "format_date"=>null
                                                ),
                               ),
                           ),
     
      'ajaxSaveNewUnitI18n'=>array(
                                    'template'=>"employers_ajaxNewUnitI18n.tpl",  
      ), 
     
      'ajaxSaveUnitI18n'=>array(
                                    'template'=>"employers_ajaxViewUnitI18n.tpl",  
      ),
     
     /* ======================== A D V E R T ================================================= */
     'ajaxListAdvert'=>array( 
                                    'helpers'=>array('date'=>null,'number'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialAdvert'=>array(
                               
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),

     /* ======================== REQUEST ================================================= */
     'ajaxListRequest'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialRequest'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
       
     /* ======================== A L E R T ================================================= */
     'ajaxListAlert'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialAlert'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     /* ======================== P O P U L A R ================================================= */
     'ajaxListPopular'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialPopular'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     /*====================================== CATEGORY P O P U L A R ===================================================*/
       'ajaxListCategoryPopular'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialCategoryPopular'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
       /*====================================== EMPLOYER P O P U L A R ===================================================*/
       'ajaxListEmployerPopular'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialEmployerPopular'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
       /*====================================== EMPLOYER COMPANY  P O P U L A R ===================================================*/
       'ajaxListCompanyPopular'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialCompanyPopular'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     /* ======================== S E A R C H ================================================= */
     'ajaxListSearch'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialSearch'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),

     /* ======================== C L A I M ================================================= */  
    'ajaxListClaim'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
     
    'ajaxListPartialClaim'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
     
       /* ======================== F U N C T I O N ================================================= */  
     'ajaxListFunction'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialFunction'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      "ajaxSaveNewMultipleFunctionI18n"=>array(
         'template'=>'employers_ajaxNewMultipleFunctionI18n.tpl'
     ),
     
     /*=====================================================================================*/
     'ajaxListType'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialType'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     
     
     
     'ajaxListCompanyForGalleryI18n'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialCompanyForGalleryI18n'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     
       'ajaxDisplayAdvert'=>array(
                               
                            'helpers'=>array('date'=>null,'number'=>null),         
                            ),
     
     
       /* ======================== L A N G U A G E  L E V E L================================================= */
     'ajaxListLanguageLevel'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialLanguageLevel'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxSaveNewLanguageLevelI18n'=>array(
                                    'template'=>"employers_ajaxNewLanguageLevelI18n.tpl",  
      ), 
     
      'ajaxSaveLanguageLevelI18n'=>array(
                                    'template'=>"employers_ajaxViewLanguageLevelI18n.tpl",  
      ), 
     
     
       /* ======================== A C T I V I T Y ================================================= */
     
      'ajaxSaveNewActivityI18n'=>array(
                                    'template'=>"employers_ajaxNewActivityI18n.tpl",  
      ), 
     
      'ajaxSaveActivityI18n'=>array(
                                    'template'=>"employers_ajaxViewActivityI18n.tpl",  
      ),
     'ajaxListActivity'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialActivity'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     "ajaxGenerateRevival"=>array(
          'helpers'=>array('date'=>null,'number'=>null),
     ),
 ); 
 
