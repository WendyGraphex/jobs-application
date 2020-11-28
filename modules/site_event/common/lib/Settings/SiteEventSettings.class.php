<?php

class SiteEventSettings extends SiteSettings {
    
     function getDefaults()
    {
        parent::getDefaults();
         // Emails
        $this->add(array(   "site_event_user_congratulation_email_model"=>null,
                            "site_event_user_admin_recipients"=>null,
                            "site_event_user_forgotpassword_change_email_model"=>null,
                            "site_event_user_forgotemail_email_model"=>null,
                            "site_event_user_user_account_creation_email_model"=>null,                                                         
                            "site_event_user_forgotpassword_sent_text"=>null,                         
                            'site_event_user_lock_time'=>5 * 60,      
                            'site_event_reference_format'=>null,
                            'site_event_id_format'=>null,
            
                            'site_event_created_model'=>null,
                            'site_event_refused_model'=>null,
                            'site_event_published_model'=>null,
                            'site_event_closed_model'=>null,
                            'site_event_committed_model'=>null,                                        
                            'site_event_tax_rate'=>null,
            ));
        
    }
    
      function getTax()
    {
        return $this->_site_event_tax_rate=$this->_site_event_tax_rate===null?new SaleTax($this->get('site_event_tax_rate')):$this->_site_event_tax_rate;
    }
      
    function hasCongratulationEmailModel()
    {
        return (boolean)$this->get('site_event_user_congratulation_email_model');
    }
    
    function getCongratulationEmailModel()
    {
        return new SystemModelEmail($this->get('site_event_user_congratulation_email_model','site_event_user_congratulation_email_model'));
    }
    
    function getAdminRecipients()
     {
         if ($this->hasAdminRecipients())
            return $this->get("site_event_user_admin_recipients");
         return new mfArray();
     }
     
      function hasAdminRecipients()
    {
        return (boolean)$this->get('site_event_user_admin_recipients');
    }  
    
    function hasForgotPasswordEmailModel()
    {
        return (boolean)$this->get('site_event_user_forgotpassword_email_model');
    }
     
    function getForgotPasswordEmailModel()
    {
        return new SystemModelEmail($this->get('site_event_user_forgotpassword_email_model','site_event_user_forgotpassword_email_model'));
    }
    
   function hasForgotPasswordSentTextModel()
    {
        return (boolean)$this->get('site_event_user_forgotpassword_sent_text');
    }  
     
     function getForgotPasswordSentTextModel()
     {
         return new SystemModelText($this->get('site_event_user_forgotpassword_sent_text'));
     }
     
     
     function hasForgotPasswordChangeEmailModel()
    {
       return (boolean)$this->get('site_event_user_forgotpassword_change_email_model'); 
    }
    
    function getForgotPasswordChangeEmailModel()
    {
       return new SystemModelEmail($this->get('site_event_user_forgotpassword_change_email_model','site_event_user_forgotpassword_change_email_model')); 
    }
    
     function getLockTime()
    {
        return $this->get('site_event_user_lock_time',5) * 1000;
    }
    
     function hasUserAccountCreationEmailModel()
    {
       return (boolean)$this->get('site_event_user_user_account_creation_email_model'); 
    }   
    
     function getUserAccountCreationEmailModel()
    {
       return new SystemModelEmail($this->get('site_event_user_user_account_creation_email_model','site_event_user_user_account_creation_email_model')); 
    }
    
    
    function getEventCreatedEmailModel()
    {
         return new SystemModelEmail($this->get('site_event_created_model','site_event_created_model'));  
    }
    
    function getEventRefusedEmailModel()
    {
         return new SystemModelEmail($this->get('site_event_refused_model','site_event_refused_model'));  
    }
    
    function getEventPublishedEmailModel()
    {
         return new SystemModelEmail($this->get('site_event_published_model','site_event_published_model'));  
    }
    
    function getEventClosedEmailModel()
    {
         return new SystemModelEmail($this->get('site_event_closed_model','site_event_closed_model'));  
    }
    
    function getEventCommittedEmailModel()
    {
        return new SystemModelEmail($this->get('site_event_committed_model','site_event_committed_model'));  
    }
    
    function getEventDeletedEmailModel()
    {
        return new SystemModelEmail($this->get('site_event_deleted_model','site_event_deleted_model'));  
    }
    
    function getNumberOfYearBirthDay()
    {
        return $this->get('site_event_user_birthday_number_of_year');
    }
}
