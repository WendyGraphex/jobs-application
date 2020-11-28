<?php


class SaleBillingModelParameters extends mfModelParameters {
    
    
    static function loadParameters(SaleBilling $billing,mfAction $action)
    {                        
       $action->today=self::format_date(date("Y-m-d"));  
        $action->company= SiteCompany::getSiteCompany()->toArray();    
       $action->billing=$billing->getFormatter()->toArrayForPdf();       
       $action->employer=$billing->getEmployerUser()->getFormatter()->toArrayForPdf();    
       //$action->employee=$billing->getEmployeeUser()->getFormatter()->toArrayForPdf(); 
    }   
  
}


