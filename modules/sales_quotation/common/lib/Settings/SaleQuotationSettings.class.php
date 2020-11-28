<?php

class SaleQuotationSettings extends SiteSettings {
    
    
    function getDefaults()
    {
        parent::getDefaults();      
        $this->add(array(                                       
                            "employer_quotation_refused_email_model"=>null,
                            "employer_quotation_negociated_email_model"=>null,
                            "employer_quotation_accepted_email_model"=>null,
                            "employer_quotation_revival_email_model"=>null,
                            "employer_quotation_schedule_email_model"=>null,
            
                            "employer_quotation_request_email_model"=>null,
                          
                            "employee_quotation_proposed_email_model"=>null,  
                            "employee_quotation_refused_email_model"=>null,
                            "employee_quotation_negociated_email_model"=>null,
                            "employee_quotation_accepted_email_model"=>null,
                            "employee_quotation_revival_email_model"=>null,
                            "employee_quotation_schedule_email_model"=>null,
            
                            'employee_quotation_request_revival_email_model'=>null,
                            'employer_quotation_request_revival_email_model'=>null,
            
                            "employee_quotation_request_revival_iteration"=>2,
                            "employee_quotation_request_revival_day_schedule"=>1,
            
                            "quotation_recipients"=>null,
            ));
        
    }
      
    function getEmployeeNegociateEmailModel()
    {
         return new SystemModelEmail($this->get('employee_quotation_negociated_email_model'));
    }
    
     function getEmployeeRefusedEmailModel()
    {
        return new SystemModelEmail($this->get('employee_quotation_refused_email_model')); 
    }
    
      function getEmployeeAcceptedEmailModel()
    {
         return new SystemModelEmail($this->get('employee_quotation_accepted_email_model'));
    }
    
      function getEmployeeRevivalEmailModel()
    {
         return new SystemModelEmail($this->get('employee_quotation_revival_email_model'));
    }
    
    function getEmployerNegociateEmailModel()
    {
         return new SystemModelEmail($this->get('employer_quotation_negociated_email_model'));
    }
    
     function getEmployerRefusedEmailModel()
    {
        return new SystemModelEmail($this->get('employer_quotation_refused_email_model')); 
    }
    
      function getEmployerAcceptedEmailModel()
    {
         return new SystemModelEmail($this->get('employer_quotation_accepted_email_model'));
    }
    
      function getEmployerRevivalEmailModel()
    {
         return new SystemModelEmail($this->get('employer_quotation_revival_email_model'));
    }
    
     function getEmployeeProposedEmailModel()
    {
         return new SystemModelEmail($this->get('employee_quotation_proposed_email_model'));
    }
    
       function getEmployeeScheduleEmailModel()
    {
         return new SystemModelEmail($this->get('employee_quotation_schedule_email_model'));
    }
    
      function getEmployerScheduleEmailModel()
    {
         return new SystemModelEmail($this->get('employer_quotation_schedule_email_model'));
    }
    
    function getEmployerRequestEmailModel()
     {
         return new SystemModelEmail($this->get('employer_quotation_request_email_model'));
    }
    
    function getEmployeeRequestEmailModel()
     {
         return new SystemModelEmail($this->get('employee_quotation_request_email_model'));
    }
    
    function getAdminRecipients()
     {
         if ($this->hasAdminRecipients())
            return $this->get("quotation_recipients");
         return new mfArray();
     }
     
      function hasAdminRecipients()
    {
        return (boolean)$this->get('quotation_recipients');
    }  
    
    
    function getEmployeeRequestRevivalEmailModel()
    {
        return new SystemModelEmail($this->get('employee_quotation_request_revival_email_model','employee_quotation_request_revival_email_model')); 
    }
    
    function getEmployerRequestRevivalEmailModel()
    {
        return new SystemModelEmail($this->get('employer_quotation_request_revival_email_model','employer_quotation_request_revival_email_model')); 
    }
}
