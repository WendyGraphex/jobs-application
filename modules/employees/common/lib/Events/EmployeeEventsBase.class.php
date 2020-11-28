<?php

class EmployeeEventsBase {
     
 
     
     static function setQuotationPaid(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees'))
             return ;
        $payment = $event->getSubject();    //PaymentEmployerUser    
        if (!$payment->isAccepted()) 
            return ; 
        // Employee advert
       /* $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('order_id'=>$payment->get('order_id')))
                  ->setQuery("UPDATE ".EmployeeAdvert::getTable().
                             " INNER JOIN ".SaleEmployeeQuotation::getTable()." ON ".SaleEmployeeQuotation::getTableField('employee_advert_id')."=".EmployeeAdvert::getTableField('id').
                             " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').
                             " SET status='DELETE'".
                             " WHERE order_id='{order_id}' AND ".SaleEmployeeQuotation::getTableField('employee_advert_id')." IS NOT NULL".
                             ";")
                  ->makeSqlQuery();      
        
        $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('order_id'=>$payment->get('order_id')))
                  ->setQuery("UPDATE ".EmployeeAdvertI18n::getTable().                           
                             " INNER JOIN ".SaleEmployeeQuotation::getTable()." ON ".SaleEmployeeQuotation::getTableField('employee_advert_id')."=".EmployeeAdvertI18n::getTableField('advert_id').
                             " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').
                             " SET status='DELETE'".
                             " WHERE order_id='{order_id}'AND ".SaleEmployeeQuotation::getTableField('employee_advert_id')." IS NOT NULL".
                             ";")
                  ->makeSqlQuery();  */
        
        $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('order_id'=>$payment->get('order_id')))
                  ->setQuery("UPDATE ".SaleEmployeeQuotation::getTable().                          
                             " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').
                             " SET ".SaleEmployeeQuotation::getTableField('state')."='PAID'".
                             " WHERE order_id='{order_id}' ".
                             ";")
                  ->makeSqlQuery();  
        
        
    }   
     
}

