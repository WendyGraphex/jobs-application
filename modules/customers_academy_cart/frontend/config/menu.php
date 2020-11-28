<?php

return array(

    "menu" => array(
       
        "employer.dashboard"=>array(                                          
                        "childs"=>array(         
                                "075_employer_mycart"=>null,      
                             //   "080_employer_mycarts"=>null,                             
                            ),                     
                    ),  
    ),          

    "items" => array(
          "075_employer_mycart"=>array(
                     "title"=>"My Cart", 
                     "mdi"=>"mdi-cart",                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('cart_ajax'=>array('action'=>'MyCart')),
                     "component"=>"/cart/myCartItemMenu",
                     "enabled"=>true,                                  
                 ),   
      
          "080_employer_mycarts"=>array(
                     "title"=>"My Carts", 
                     "mdi"=>"mdi-cart",                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('cart_ajax'=>array('action'=>'MyCarts')),
                     "enabled"=>true,                                  
                 ),   
    ),


);
