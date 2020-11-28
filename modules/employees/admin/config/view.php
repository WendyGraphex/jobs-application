<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
      'ajaxListEmployee'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialEmployee'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     "ajaxNewEmployee"=>array(
                 'helpers'=>array("number"=>null),      
              
                 'widgets'=>array('select_country'=>''), 
           
     ),
     
      "ajaxViewEmployee"=>array(
                 'helpers'=>array("number"=>null),      
             
                 'widgets'=>array('select_country'=>''), 
                
     ),
     
     "ajaxDisplayEmployee"=>array(
                 'helpers'=>array("number"=>null),      
             
                 'widgets'=>array('select_country'=>''), 
                
     ),
     
     
      "ajaxSaveEmployee"=>array(
                 'template'=>'employees_ajaxViewEmployee.tpl',
                 'helpers'=>array("number"=>null),                 
                 'widgets'=>array('select_country'=>''), 
               
     ),
              
        "ajaxSaveCreatePasswordUser"=>array(
                    "template"=>"employees_ajaxCreatePasswordUser.tpl"
     ),
    
     
            /*======================================  C O N T A C T ===================================================*/
      'ajaxListContact'=>array( 
                                    'helpers'=>array('date'=>null),                        
                            ),
     
      'ajaxListPartialContact'=>array(
                           
                            'helpers'=>array('date'=>null),
           
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
     /*====================================== A D V E R T ===================================================*/
     
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
     
        /*====================================== R E Q U E S T ===================================================*/
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
     
      /*====================================== A L E R T ===================================================*/
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
     
     /*====================================== ADVERT P O P U L A R ===================================================*/
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
     
     
     /*====================================== EMPLOYEE P O P U L A R ===================================================*/
       'ajaxListEmployeePopular'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialEmployeePopular'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     /*====================================== SEARCH  ===================================================*/
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
     
      /*====================================== C O N T A C T ===================================================*/
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
  /* ================= C L A I M ======================================= */
     
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
     
     /* =========================== G A L L E R Y ================================ */ 
     "ajaxListGallery"=>array(
          'helpers'=>array('date'=>null),
         
      ),
     
      "ajaxListPartialGallery"=>array(
          'helpers'=>array('date'=>null),
         
      ),
     
     "ajaxSaveGallery"=>array(
       "template"=>"employees_ajaxViewGallery.tpl"  
     ),  
         
     "ajaxSaveNewGalleryI18n"=>array(
         "template"=>"employees_ajaxNewGalleryI18n.tpl"
     ),
     
     "ajaxSaveGalleryI18n"=>array(
         "template"=>"employees_ajaxViewGalleryI18n.tpl"
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
                                    'template'=>"employees_ajaxNewLevelI18n.tpl",  
      ), 
     
      'ajaxSaveLevelI18n'=>array(
                                    'template'=>"employees_ajaxViewLevelI18n.tpl",  
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
     
     'ajaxSaveNewFunctionI18n'=>array(
                                    'template'=>"employees_ajaxNewFunctionI18n.tpl",  
      ), 
     
      'ajaxSaveFunctionI18n'=>array(
                                    'template'=>"employees_ajaxViewFunctionI18n.tpl",  
      ), 
     
     
         /* ======================== G A L L E R Y ================================================= */  
     'ajaxListEmployeeForGalleryI18n'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialEmployeeForGalleryI18n'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     
       'ajaxDisplayAdvert'=>array(
                               
                            'helpers'=>array('date'=>null,'number'=>null),         
                            ),
     
      /* ======================== E X P E R I E N C E ================================================= */  
     'ajaxListExperience'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialExperience'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     'ajaxSaveNewExperienceI18n'=>array(
                                    'template'=>"employees_ajaxNewExperienceI18n.tpl",  
      ), 
     
      'ajaxSaveExperienceI18n'=>array(
                                    'template'=>"employees_ajaxViewExperienceI18n.tpl",  
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
                                    'template'=>"employees_ajaxNewLanguageLevelI18n.tpl",  
      ), 
     
      'ajaxSaveLanguageLevelI18n'=>array(
                                    'template'=>"employees_ajaxViewLanguageLevelI18n.tpl",  
      ), 
     
      /* ======================== S K I L L================================================= */
     'ajaxListSkill'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialSkill'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxSaveNewSkillI18n'=>array(
                                    'template'=>"employees_ajaxNewSkillI18n.tpl",  
      ), 
     
      'ajaxSaveSkillI18n'=>array(
                                    'template'=>"employees_ajaxViewSkillI18n.tpl",  
      ), 
     
     "ajaxSaveNewMultipleSkillI18n"=>array(
         'template'=>'employees_ajaxNewMultipleSkillI18n.tpl'
     ),
     
         /* ======================== G R A D U A T E   D I P L O M A ================================================= */
     
     'ajaxListGraduate'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialGraduate'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxSaveNewGraduateI18n'=>array(
                                    'template'=>"employees_ajaxNewGraduateI18n.tpl",  
      ), 
     
      'ajaxSaveGraduateI18n'=>array(
                                    'template'=>"employees_ajaxViewGraduateI18n.tpl",  
      ), 
     
     "ajaxGenerateRevival"=>array(
          'helpers'=>array('date'=>null,'number'=>null),
     ),
     
 ); 
 
