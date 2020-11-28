<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
    
      /* ========================================== P R O J E C T ================================================ */
     
     "ajaxSaveProject"=>array(
         'template'=>"employers_project_ajaxViewProject.tpl",
           'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxViewProject"=>array(
            'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxNewProject"=>array(
         'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxListProject"=>array(
            'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxListPartialProject"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxListPartialDialogProject"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
     
     "ajaxUploadProjectDocument"=>array(
          'helpers'=>array('number'=>null)
     ),
     
       "ajaxDisplayProject"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),

      'New' => array(
        'blocks'=>array("JqueryScriptsReady"=>null),
        'helpers'=>array('number'=>null,'date'=>null),
       /* 'layout' => array(
            "template" => "default.xml",
        ),*/
        'stylesheets' => array(
         
        ),
        'javascripts' => array(
            
        ),
        'title' => "My account",
        'widgets' => array("banner" => null),
        'metas' => array(
            "description" => "super web",
            "keywords" => "key1,key2...",
        ),
    ),
     
     "ajaxDisplayProjectRequestForEmployee"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
     
        "ajaxCreateProjectForQuote"=>array(
         'helpers'=>array('number'=>null,'date'=>null)
     ),
     
          "project"=>array(
         'helpers'=>array('number'=>null,'date'=>null)
     ),
 ); 
 
