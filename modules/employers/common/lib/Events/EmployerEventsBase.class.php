<?php

class  EmployerEventsBase {
     
 
     
     static function setDeleteAdvertsAfterPaid(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers'))
             return ;
        $payment = $event->getSubject();    //PaymentEmployerUser    
        if (!$payment->isAccepted()) 
            return ; 
        // Employer advert
        $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('order_id'=>$payment->get('order_id')))
                  ->setQuery("UPDATE ".EmployerAdvert::getTable().
                             " INNER JOIN ".SaleEmployeeQuotation::getTable()." ON ".SaleEmployeeQuotation::getTableField('employer_advert_id')."=".EmployerAdvert::getTableField('id').
                             " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').
                             " SET ".EmployerAdvert::getTableField('status')."='CLOSE'".
                             " WHERE order_id='{order_id}' AND ".SaleEmployeeQuotation::getTableField('employer_advert_id')." IS NOT NULL".
                             ";")
                  ->makeSqlQuery();      
        
        $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('order_id'=>$payment->get('order_id')))
                  ->setQuery("UPDATE ".EmployerAdvertI18n::getTable().                           
                             " INNER JOIN ".SaleEmployeeQuotation::getTable()." ON ".SaleEmployeeQuotation::getTableField('employer_advert_id')."=".EmployerAdvertI18n::getTableField('advert_id').
                             " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').
                             " SET ".EmployerAdvertI18n::getTableField('status')."='CLOSE'".
                             " WHERE order_id='{order_id}'AND ".SaleEmployeeQuotation::getTableField('employer_advert_id')." IS NOT NULL".
                             ";")
                  ->makeSqlQuery();         
    }   
}

