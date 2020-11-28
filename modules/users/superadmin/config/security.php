<?php
// key = [action][view]
// By default module/block is secure
 return array(
     
            'dashboardList'=>array(
                                'is_secure'=>true,
                                'credentials'=>array(array('superadmin','admin')),
                            ),   
            ); 
 //  array(array('superadmin_write5','admin_write2','superadmin')) = 'superadmin_write5' OR 'admin_write2' OR 'superadmin'