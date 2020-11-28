<?php


return array(

    "payments_ajax" => array("pattern" => '/module/payments/admin/{action}', 
                               "module" => "payments", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    "payments_success"=>array("pattern"=>'/payments/{payment}/success',"module"=>"payments","action"=>"Success",
                              "requirements"=>array("payment"=>".*"),
                              "parameters"=>array("method"=>"{payment}")
                             ),
    
    "payments_cancel"=>array("pattern"=>'/payments/{payment}/cancel',"module"=>"payments","action"=>"Cancel",
                              "requirements"=>array("payment"=>".*"),
                              "parameters"=>array("method"=>"{payment}")
                             ),
    
    "payments_automatic"=>array("pattern"=>'/payments/{payment}/automatic',"module"=>"payments","action"=>"AutomaticResponse",
                              "requirements"=>array("payment"=>".*"),
                              "parameters"=>array("method"=>"{payment}")
                            ),
    
    "payments"=>array("pattern"=>'/payments/admin/{action}',"module"=>"payments","action"=>"{action}","requirements"=>array("action"=>".*")),
      
    "payments_process_ajax"=>array("pattern"=>'/module/payments/{payment}/process/debit',"module"=>"payments","action"=>"ajaxProcess",
                              "requirements"=>array("payment"=>".*"),
                              "parameters"=>array("method"=>"{payment}")
                             ),
    
     "payments_process_credit_ajax"=>array("pattern"=>'/module/payments/{payment}/process/credit',"module"=>"payments","action"=>"ajaxCreditProcess",
                              "requirements"=>array("payment"=>".*"),
                              "parameters"=>array("method"=>"{payment}")
                             ),
    
     "payments_proceed"=>array("pattern"=>'/module/payments/{payment}/proceed',"module"=>"payments","action"=>"proceed",
                              "requirements"=>array("payment"=>".*"),
                              "parameters"=>array("method"=>"{payment}")
                             ),
    
    
     "payments_proceed_credit"=>array("pattern"=>'/module/payments/{payment}/proceed/credit',"module"=>"payments","action"=>"creditproceed",
                              "requirements"=>array("payment"=>".*"),
                              "parameters"=>array("method"=>"{payment}")
                             ),
    
    
    "payments_process_event_ajax"=>array("pattern"=>'/module/events/payments/{payment}/process/debit',
                              "module"=>"payments","action"=>"ajaxProcessEventDebit",
                              "requirements"=>array("payment"=>".*"),
                              "parameters"=>array("method"=>"{payment}")
                             ),
    
      "payments_proceed_event"=>array("pattern"=>'/module/events/payments/{payment}/proceed',
                              "module"=>"payments","action"=>"proceedEventDebit",
                              "requirements"=>array("payment"=>".*"),
                              "parameters"=>array("method"=>"{payment}")
                             ),
    
    
    
    
     "payments_event_success"=>array("pattern"=>'/payments/event/{payment}/success',"module"=>"payments","action"=>"EventSuccess",
                              "requirements"=>array("payment"=>".*"),
                              "parameters"=>array("method"=>"{payment}")
                             ),
    
    "payments_event_cancel"=>array("pattern"=>'/payments/event/{payment}/cancel',"module"=>"payments","action"=>"EventCancel",
                              "requirements"=>array("payment"=>".*"),
                              "parameters"=>array("method"=>"{payment}")
                             ),
);