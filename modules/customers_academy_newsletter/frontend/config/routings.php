<?php

return array(
    "customers_academy_newsletter_newsletter_unsubscribe"=>array("pattern"=>'/academy/customers/newsletter/unsubscribe',"module"=>"customers_academy_newsletter","action"=>"unsubscribe"),
    
     "customers_academy_newsletter_ajax"=>array("pattern"=>'/academy/module/customers/newsletter/{action}',
                    "module"=>"customers_academy_newsletter",
                    "action" => "ajax{action}", 
                    "requirements" => array("action" =>".*")
            ),
);
