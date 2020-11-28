<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
      /* ************************* Q U O T A T I O N ************************************* */  
      "ajaxListQuotationForEmployee"=>array(
            'helpers'=>array('number'=>null,'date'=>null,'time'=>null)
     ),
     
      "ajaxListPartialQuotationForEmployee"=>array(
          'helpers'=>array('number'=>null,'date'=>null,'time'=>null)
     ),
     
        "ajaxListQuotationForEmployer"=>array(
            'helpers'=>array('number'=>null,'date'=>null,'time'=>null)
     ),
     
      "ajaxListPartialQuotationForEmployer"=>array(
          'helpers'=>array('number'=>null,'date'=>null,'time'=>null)
     ),
     
     /* ************************* R E Q U E S T ************************************* */
      "ajaxListRequestForEmployee"=>array(
            'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxListPartialRequestForEmployee"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
     
        "ajaxListRequestForEmployer"=>array(
            'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxListPartialRequestForEmployer"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
     
     "ajaxSendQuoteNegociatedEmployee"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
     
     "ajaxSendQuoteNegociatedDialogEmployee"=>array(
          'helpers'=>array('number'=>null)
     ),
     
     "ajaxSendQuoteNegociatedEmployer"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
     
       "ajaxDialogHistoryEmployee"=>array(
          'helpers'=>array('number'=>null,'date'=>null,'time'=>null)
     ),
     
        "ajaxDialogHistoryEmployer"=>array(
          'helpers'=>array('number'=>null,'date'=>null,'time'=>null)
     ),
     
     "ajaxSendQuoteScheduleEmployee"=>array(
          'helpers'=>array('date'=>null)
     ),
     
      "ajaxSendQuoteAcceptedEmployee"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxSendQuoteAcceptedEmployer"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
     
     "emailEmployeeRequestRevival"=>array(
         'template'=>"./../blocks/sales_quotation_emailEmployeeRequestRevival.tpl"
     ),
     
      "emailEmployerRequestRevival"=>array(
         'template'=>"./../blocks/sales_quotation_emailEmployerRequestRevival.tpl"
     )
 ); 
 


