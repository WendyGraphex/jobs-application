<?php

return array(
    "customers_newsletter_newsletter_unsubscribe"=>array("pattern"=>'/customers/newsletter/unsubscribe',"module"=>"customers_newsletter","action"=>"unsubscribe"),
    
     "customers_newsletter_ajax"=>array("pattern"=>'/module/customers/newsletter/{action}',
                    "module"=>"customers_newsletter",
                    "action" => "ajax{action}", 
                    "requirements" => array("action" =>".*")
            ),
);
