<?php


class SiteEventOrderModelParameters extends mfModelParameters {
    
    
    static function loadParameters(SiteEventOrder $order,mfAction $action)
    {                        
       $action->today=self::format_date(date("Y-m-d"));  
       // Company
       $action->company= SiteCompany::getSiteCompany()->toArray();    
       $action->order=$order->getFormatter()->toArrayForPdf();       
       $action->employer=$order->getEmployerUser()->getFormatter()->toArrayForPdf();       
     
    }
    
  
}


