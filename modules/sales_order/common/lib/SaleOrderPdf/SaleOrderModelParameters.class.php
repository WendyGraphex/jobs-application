<?php


class SaleOrderModelParameters extends mfModelParameters {
    
    
    static function loadParameters(SaleOrder $order,mfAction $action)
    {                        
       $action->today=self::format_date(date("Y-m-d"));  
       // Company
       $action->company= SiteCompany::getSiteCompany()->toArray();    
       $action->order=$order->getFormatter()->toArrayForPdf();       
       $action->employer=$order->getEmployerUser()->getFormatter()->toArrayForPdf();       
     
    }
    
  
}


