<?php

class PaymentSettings extends SiteSettings {
        
    
     function getDefaults()
    {
        parent::getDefaults();         
        $this->add(array( 
              'payment_format_reference'=>'CART-{id}',
              'payment_format_id'=>'0000',
             // 'order_default_currency'=>'USD',
        ));        
    }
      
   /* function getDefaultCurrency()
    {
        return $this->currency=$this->currency===null?new SiteCurrency($this->get('order_default_currency','USD')):$this->currency;
    }*/
    
    function hasPaymentEmployerCreatedEmailModel()
    {
         return (boolean)$this->get('payment_employer_created_email_model'); 
    }
    
    function getPaymentEmployerCreatedEmailModel()
    {
         return new SystemModelEmail($this->get('payment_employer_created_email_model','payment_employer_created_email_model'));  
    }
    
    function hasPaymentEmployerEmployeeQuotationPaidEmailModel()
    {
         return (boolean)$this->get('payment_employer_employee_quotation_paid_email_model'); 
    }
    
    function getPaymentEmployerEmployeeQuotationPaidEmailModel()
    {
         return new SystemModelEmail($this->get('payment_employer_employee_quotation_paid_email_model','payment_employer_employee_quotation_paid_email_model'));  
    }
    
    
     function hasPaymentEmployeeCreatedEmailModel()
    {
         return (boolean)$this->get('payment_employee_created_email_model'); 
    }
    
    function getPaymentEmployeeCreatedEmailModel()
    {
         return new SystemModelEmail($this->get('payment_employee_created_email_model','payment_employee_created_email_model'));  
    }
    
    function getAdminRecipients()
     {
         if ($this->hasAdminRecipients())
            return $this->get("payment_employer_admin_recipients");
         return new mfArray();
     }
     
      function hasAdminRecipients()
    {
        return (boolean)$this->get('payment_employer_admin_recipients');
    }  
}
