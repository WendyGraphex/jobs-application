<?php

class EmployerSettings extends SiteSettings {
    
     function getDefaults()
    {
        parent::getDefaults();
         // Emails
        $this->add(array(//"forgotpassword_email"=>null,
                            "employer_validation_email_model"=>null,
                            "employer_congratulation_email_model"=>null,
                            "employer_admin_recipients"=>null,
                            "employer_forgotpassword_change_email_model"=>null,
                            "employer_forgotemail_email_model"=>null,
                            "employer_user_account_creation_email_model"=>null,
            
            
                            "employer_advert_refused_email_model"=>null,
                            "employer_advert_published_email_model"=>null,
                            "employer_advert_created_email_model"=>null,
                            "employer_advert_revival_email_model"=>null,
            
            
                            "employer_advert_i18n_refused_email_model"=>null,
                            "employer_advert_i18n_published_email_model"=>null,
                            "employer_advert_i18n_created_email_model"=>null,
                            "employer_advert_i18n_revival_email_model"=>null,
              
                            "employer_advert_revival_iteration"=>3,
                            "employer_advert_revival_day_schedule"=>2,
             
                        // TEXT
                             "employer_forgotpassword_sent_text"=>null,
                          //  "forgotpassword_confirm_text"=>null,
             
                          //  "account_confirm_text"=>null,
                          //  "signin_validation_email"=>null,
                          //  "success_confirm_text"=>null,
             
                         //   "cookie_expiration_age"=>15 * 24 * 3600, // 15 days
                         //   "authorized_cultures"=>array('fr','nl','en'), //,'en_US')*/
                            'employer_lock_time'=>5 * 60,
                            
            ));
        
    }
      
    function hasCongratulationEmailModel()
    {
        return (boolean)$this->get('employer_congratulation_email_model');
    }
    
    function getCongratulationEmailModel()
    {
        return new SystemModelEmail($this->get('employer_congratulation_email_model','employer_congratulation_email_model'));
    }
    
    function hasValidationEmailModel()
    {
        return (boolean)$this->get('employer_validation_email_model');
    }
    
    function getValidationEmailModel()
    {
        return new SystemModelEmail($this->get('employer_validation_email_model','employer_validation_email_model'));
    }
    
    function getAdminRecipients()
     {
         if ($this->hasAdminRecipients())
            return $this->get("employer_admin_recipients");
         return new mfArray();
     }
     
      function hasAdminRecipients()
    {
        return (boolean)$this->get('employer_admin_recipients');
    }  
    
    function hasForgotPasswordEmailModel()
    {
        return (boolean)$this->get('employer_forgotpassword_email_model');
    }
     
    function getForgotPasswordEmailModel()
    {
        return new SystemModelEmail($this->get('employer_forgotpassword_email_model','employer_forgotpassword_email_model'));
    }
    
   function hasForgotPasswordSentTextModel()
    {
        return (boolean)$this->get('employer_forgotpassword_sent_text','employer_forgotpassword_sent_text');
    }  
     
     function getForgotPasswordSentTextModel()
     {
         return new SystemModelText($this->get('employer_forgotpassword_sent_text','employer_forgotpassword_sent_text'));
     }
     
     
     function hasForgotPasswordChangeEmailModel()
    {
       return (boolean)$this->get('employer_forgotpassword_change_email_model','employer_forgotpassword_change_email_model'); 
    }
    
    function getForgotPasswordChangeEmailModel()
    {
       return new SystemModelEmail($this->get('employer_forgotpassword_change_email_model')); 
    }
    
     function getLockTime()
    {
        return $this->get('employer_lock_time',5) * 1000;
    }
    
     function hasUserAccountCreationEmailModel()
    {
       return (boolean)$this->get('employer_user_account_creation_email_model'); 
    }
    
    
     function getUserAccountCreationEmailModel()
    {
       return new SystemModelEmail($this->get('employer_user_account_creation_email_model','employer_user_account_creation_email_model')); 
    }
    
   
      function getMinAge()
    {
        return intval($this->get("employer_min_age",18));
    }
    
    function getMaxLanguages()
    {
        return intval($this->get("employer_max_languages",5));
    }
    
      function getAdvertRefusedEmailModel()
    {
        return new SystemModelEmail($this->get('employer_advert_refused_email_model'));
    }
    
     function getAdvertPublishedEmailModel()
    {
        return new SystemModelEmail($this->get('employer_advert_published_email_model'));
    }
    
     function getAdvertCreatedEmailModel()
    {
        return new SystemModelEmail($this->get('employer_advert_created_email_model'));
    }
    
     function getAdvertRevivalEmailModel()
    {
        return new SystemModelEmail($this->get('employer_advert_revival_email_model'));
    }
    
    
      function getAdvertI18nRefusedEmailModel()
    {
        return new SystemModelEmail($this->get('employer_advert_i18n_refused_email_model'));
    }
    
     function getAdvertI18nPublishedEmailModel()
    {
        return new SystemModelEmail($this->get('employer_advert_i18n_published_email_model'));
    }
    
     function getAdvertI18nCreatedEmailModel()
    {
        return new SystemModelEmail($this->get('employer_advert_i18n_created_email_model'));
    }
    
    function getAdvertI18nRevivalEmailModel()
    {
        return new SystemModelEmail($this->get('employer_advert_i18n_revival_email_model'));
    }
    
    function getAlertPostedEmailModel()
    {
        return new SystemModelEmail($this->get('employer_alert_posted_email_model'));
    }
    
    function getAlertDeletedEmailModel()
    {
        return new SystemModelEmail($this->get('employer_alert_deleted_email_model'));
    }
    
    function getAlertCreatedEmailModel()
    {
        return new SystemModelEmail($this->get('employer_alert_created_email_model'));
    }
    
    function getAlertRecipients()
     {
         if ($this->get("employer_alert_recipients"))
            return $this->get("employer_alert_recipients");
         return new mfArray();
     }
     
     function getNumberOfYearBirthDay()
     {
         return $this->get('employee_birthday_number_of_year');
     }
}
