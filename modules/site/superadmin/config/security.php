<?php
// key = [action][view]
// By default module/block is secure
 return array(
       /*     'testFile'=>array(
                            'is_secure'=>false,
                          ),
            'testFile2'=>array(
                            'is_secure'=>false,
                          ),
            'testFileAjax'=>array(
                            'is_secure'=>false,
                          ), */
             'sitesList'=>array(
                          //        'is_secure'=>true,
                                //  'credentials'=>array(array('superadmin_write2','admin_write','superadmin')),
                                // 'components'=>array(
                                //        "/category/link"=>array(array('super','admin_write2','superadmin')),
                                //       ),
                                  ),
            ); 
 
/*  
 array('superadmin_toto','admin','superadmin_specific'),array('superadmin2','superadmin')
  
 === ('superadmin_toto' OR 'admin' OR 'superadmin_specific') AND ('superadmin2' OR'superadmin')
 
  */