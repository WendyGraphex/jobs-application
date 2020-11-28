<?php


return array('all'=>array('classView'=>'SmartyView',
                           'widgets'=>array('messages'=>null,'alerts'=>null),                             
                          ),
   /* ================================================================================================ */          
   'ajaxListUser'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialUser'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
    /* ================================================================================================ */
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
      /* ================================================================================================ */          
   'ajaxListSpeakerUser'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialSpeakerUser'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
    
     /* ================================================================================================ */          
   'ajaxListEvent'=>array( 
                                    'helpers'=>array('date'=>null,'number'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialEvent'=>array(
                               
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
    
     'ajaxNewEventI18n'=>array(
          'widgets'=>array('select_country'=>''), 
                'helpers'=>array('date'=>null,'number'=>null),
         "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
      ), 
     
      'ajaxViewEventI18n'=>array(
           'widgets'=>array('select_country'=>''), 
            'helpers'=>array('date'=>null,'number'=>null),
          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
      ), 
    
     'ajaxDisplayEventI18n'=>array(         
            'helpers'=>array('date'=>null,'number'=>null),
          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
      ), 
    
     'ajaxSaveNewEventI18n'=>array(
          'widgets'=>array('select_country'=>''), 
                                    'template'=>"site_event_ajaxNewEventI18n.tpl",  
               'helpers'=>array('date'=>null,'number'=>null),
         "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
      ), 
     
      'ajaxSaveEventI18n'=>array(
           'widgets'=>array('select_country'=>''), 
                                    'template'=>"site_event_ajaxViewEventI18n.tpl",  
           'helpers'=>array('date'=>null,'number'=>null),
         "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
      ), 
     
     /* =================================PLACE=============================================================== */
      'ajaxListPlace'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialPlace'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ), 
    
     'ajaxNewPlace'=>array(
          'widgets'=>array('select_country'=>''), 
          
      ), 
    
      'ajaxViewPlace'=>array(
          'widgets'=>array('select_country'=>''),          
      ), 
    
     'ajaxSavePlace'=>array(
          'widgets'=>array('select_country'=>''), 
                                    'template'=>"site_event_ajaxViewPlace.tpl",  
         
      ), 
    
    /* =================================SpeakerUser=============================================================== */
      'ajaxListSpeakerUser'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialSpeakerUser'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ), 
    
     'ajaxNewSpeakerUser'=>array(
          'widgets'=>array('select_country'=>''), 
          
      ), 
    
      'ajaxViewSpeakerUser'=>array(
          'widgets'=>array('select_country'=>''),          
      ), 
    
     'ajaxSaveSpeakerUser'=>array(
          'widgets'=>array('select_country'=>''), 
                                    'template'=>"site_event_ajaxViewSpeakerUser.tpl",  
         
      ), 
    
      "ajaxUploadDocumentEvent"=>array(
          'helpers'=>array('number'=>null)
     ),
    
    /* =============== COMMISSION =================================== */
     'ajaxSaveSellerCommission'=>array(
             'template'=>"site_event_ajaxViewSellerCommission.tpl",      
             'helpers'=>array("date"=>null),                                                      
     ),
     
     'ajaxViewSellerCommission'=>array(                                      
             'helpers'=>array("date"=>null),                                                      
     ),
     
     'ajaxNewSellerCommission'=>array(                                      
             'helpers'=>array("date"=>null),                                                      
     ),
     
     'ajaxListSellerCommission'=>array(                                      
             'helpers'=>array("date"=>null),   
         "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
     
     'ajaxListPartialSellerCommission'=>array(                                      
             'helpers'=>array("date"=>null),
         "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
     
      'ajaxListPartialRateForSellerCommission'=>array(                                      
             'helpers'=>array("date"=>null,'number'=>null),                                                      
     ),
     
     'ajaxSaveMultipleRateForSellerCommission'=>array(
         'helpers'=>array("date"=>null,'number'=>null),          
         'template'=>'site_event_ajaxListPartialRateForSellerCommission.tpl'
     ),
     
     
); 
 
