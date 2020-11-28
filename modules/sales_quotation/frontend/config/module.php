<?php

// key=[action]
return array(
            
    "ajaxSendRequest"=>array("mode"=>"json","helpers"=>array('number'=>null)),
    
    "ajaxRemoveRequest"=>array("mode"=>"json"),
    
    "ajaxSendOffer"=>array("mode"=>"json","helpers"=>array('number'=>null)),
    
    "ajaxRemoveOffer"=>array("mode"=>"json"),
    
    "ajaxSendQuote"=>array("mode"=>"json","helpers"=>array('number'=>null,'date'=>null)),
    
    "ajaxSendRequestQuotation"=>array("mode"=>"json","helpers"=>array('number'=>null,'date'=>null)),
    
  /*  "ajaxSendQuoteRefusedEmployer"=>array("mode"=>"json"),
    
    "ajaxSendQuoteAcceptedEmployer"=>array("mode"=>"json"),*/
    
 //   "ajaxSendQuoteNegociatedEmployer"=>array("mode"=>"json"),
    
  /*  "ajaxSendQuoteRefusedEmployee"=>array("mode"=>"json"),
    
    "ajaxSendQuoteAcceptedEmployee"=>array("mode"=>"json"),*/
    
  //  "ajaxSendQuoteNegociatedEmployee"=>array("mode"=>"json"),
    
    "ajaxSendQuoteScheduleEmployee"=>array("mode"=>"json","helpers"=>array('number'=>null,'date'=>null)),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);