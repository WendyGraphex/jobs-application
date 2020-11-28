<?php

class CustomerAcademyTeacherUserSettings extends SiteSettings {
    
    function getDefaults()
    {
        parent::getDefaults();
         // Emails
        $this->add(array(   "academy_teacher_user_congratulation_email_model"=>null,
                            "academy_teacher_user_admin_recipients"=>null,
                            "academy_teacher_user_forgotpassword_change_email_model"=>null,
                            "academy_teacher_user_forgotemail_email_model"=>null,
                            "academy_teacher_user_user_account_creation_email_model"=>null,                                                         
                            "academy_teacher_user_forgotpassword_sent_text"=>null,                         
                            'academy_teacher_user_lock_time'=>5 * 60,                            
            ));
        
    }
      
    function hasCongratulationEmailModel()
    {
        return (boolean)$this->get('academy_teacher_user_congratulation_email_model');
    }
    
    function getCongratulationEmailModel()
    {
        return new SystemModelEmail($this->get('academy_teacher_user_congratulation_email_model'));
    }
    
    function getCourseCreatedEmailModel()
    {
        return new SystemModelEmail($this->get('academy_teacher_user_course_created_email_model'));
    }
    
    function getCourseCommittedEmailModel()
    {
        return new SystemModelEmail($this->get('academy_teacher_user_course_committed_email_model'));
    }
    
    function getCoursePublishedEmailModel()
    {
        return new SystemModelEmail($this->get('academy_teacher_user_course_published_email_model'));
    }
    
    function getCourseRefusedEmailModel()
    {
        return new SystemModelEmail($this->get('academy_teacher_user_course_refused_email_model'));
    }
    
    function getCourseDeletedEmailModel()
    {
        return new SystemModelEmail($this->get('academy_teacher_user_course_deleted_email_model'));
    }
    
    function getAdminRecipients()
    {
        if ($this->hasAdminRecipients())
           return $this->get("academy_teacher_user_admin_recipients");
        return new mfArray();
    }
     
      function hasAdminRecipients()
    {
        return (boolean)$this->get('academy_teacher_user_admin_recipients');
    }  
    
    function hasForgotPasswordEmailModel()
    {
        return (boolean)$this->get('academy_teacher_user_forgotpassword_email_model');
    }
     
    function getForgotPasswordEmailModel()
    {
        return new SystemModelEmail($this->get('academy_teacher_user_forgotpassword_email_model'));
    }
    
    function hasForgotPasswordSentTextModel()
    {
        return (boolean)$this->get('academy_teacher_user_forgotpassword_sent_text');
    }  
     
    function getForgotPasswordSentTextModel()
    {
        return new SystemModelText($this->get('academy_teacher_user_forgotpassword_sent_text'));
    }
     
     
     function hasForgotPasswordChangeEmailModel()
    {
       return (boolean)$this->get('academy_teacher_user_forgotpassword_change_email_model'); 
    }
    
    function getForgotPasswordChangeEmailModel()
    {
       return new SystemModelEmail($this->get('academy_teacher_user_forgotpassword_change_email_model')); 
    }
    
     function getLockTime()
    {
        return $this->get('academy_teacher_user_lock_time',5) * 1000;
    }
    
     function hasUserAccountCreationEmailModel()
    {
       return (boolean)$this->get('academy_teacher_user_user_account_creation_email_model'); 
    }   
    
     function getUserAccountCreationEmailModel()
    {
       return new SystemModelEmail($this->get('academy_teacher_user_user_account_creation_email_model')); 
    }
    
}
