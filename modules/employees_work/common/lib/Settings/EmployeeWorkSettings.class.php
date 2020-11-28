<?php

class EmployeeWorkSettings extends SiteSettings {
        
    
     function getDefaults()
    {
        parent::getDefaults();         
        $this->add(array( 
           'work_payment_day'=>0,
            
            "work_amount_change_email_model"=>null,
        ));        
    } 
      
   function getPaymentDay()
    {
       return $this->get('work_payment_day',0) ;
    }
    
    function getPaymentRequestHour()
    {       
        return $this->get('work_payment_hour',12) ;
    }
    
    function getPaymentShift()
    {
        return $this->get('work_payment_shift',3) ;
    }
    
    
    function hasAmountChangeEmailModel()
    {
       return (boolean)$this->get('work_amount_change_email_model'); 
    }
    
    function getAmountChangeEmailModel()
    {
         return new SystemModelEmail($this->get('work_amount_change_email_model','work_amount_change_email_model')); 
    }
    
    
    function hasRefusedEmailModel()
    {
       return (boolean)$this->get('work_refused_email_model'); 
    }
    
    function getRefusedEmailModel()
    {
         return new SystemModelEmail($this->get('work_refused_email_model','work_refused_email_model')); 
    }
    
    function hasAcceptedEmailModel()
    {
       return (boolean)$this->get('work_accepted_email_model'); 
    }
    
    function getAcceptedEmailModel()
    {
         return new SystemModelEmail($this->get('work_accepted_email_model','work_accepted_email_model')); 
    }
    
    function hasConfirmedEmailModel()
    {
       return (boolean)$this->get('work_confirmed_email_model'); 
    }
    
    function getConfirmedEmailModel()
    {
         return new SystemModelEmail($this->get('work_confirmed_email_model','work_confirmed_email_model')); 
    }
    
     function hasConfirmedEmployerEmailModel()
    {
       return (boolean)$this->get('work_confirmed_employer_email_model'); 
    }
    
    function getConfirmedEmployerEmailModel()
    {
         return new SystemModelEmail($this->get('work_confirmed_employer_email_model','work_confirmed_employer_email_model')); 
    }
    
     function hasActiveEmailModel()
    {
       return (boolean)$this->get('work_active_email_model'); 
    }
    
    function getActiveEmailModel()
    {
         return new SystemModelEmail($this->get('work_active_email_model','work_active_email_model')); 
    }
    
    function getAdminRecipients()
     {
         if ($this->hasAdminRecipients())
            return $this->get("work_admin_recipients");
         return new mfArray();
     }
     
      function hasAdminRecipients()
    {
        return (boolean)$this->get('work_admin_recipients');
    }  
    
}
