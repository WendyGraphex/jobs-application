<?php

return array(

    "employer.advert.create" => array(
        "employers"=>array("EmployerEvents","updateNumberOfAdverts"),
    ),

   "quotation.created"=> array(
        "employers"=>array("EmployerEvents","updateNumberOfQuotations"),
    ),
    
     "payment.accepted"=> array(
        "employers"=>array("EmployerEvents","setDeleteAdvertsAfterPaid"),
    ),
);
