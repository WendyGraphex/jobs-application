<?php

return array(   
   
    
"customers_contact_ajax"=>array("pattern"=>'/module/customers/contact/admin/{action}',
                            "module"=>"customers_contact",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),
   
"customers_contacts"=>array("pattern"=>'/customers/contact/admin/{action}',
                            "module"=>"customers_contact",
                            "action"=>"{action}",
                            "requirements"=>array("action"=>".*")),
    
   "customers_contact_ajax"=>array("pattern"=>'/module/customers/contact/frontend/{action}',
                            "module"=>"customers_contact",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),

    "customers_contact"=>array("pattern"=>'/contact-us',
                            "module"=>"customers_contact",
                            "action"=>"contactUs",
                            "requirements"=>array("action"=>".*")),
);
