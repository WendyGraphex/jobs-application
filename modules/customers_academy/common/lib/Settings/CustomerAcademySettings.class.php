<?php

class CustomerAcademySettings extends SiteSettings {
    
    
    function getDefaults()
    {
        parent::getDefaults();
         // Emails
        $this->add(array( 
            'academy_created_email_model'=>null,
            'academy_admin_recipients'=>null,
            'academy_published_email_model'=>null,
            'academy_committed_email_model'=>null,
            'academy_refused_email_model'=>null,
            'academy_deleted_email_model'=>null
            ));
        
    }
      
      function hasCreatedEmailModel()
    {
        return (boolean)$this->get('academy_created_email_model');
    }
    
    function getCreatedEmailModel()
    {
        return new SystemModelEmail($this->get('academy_created_email_model','academy_created_email_model'));
    }
    
      function hasPublishedEmailModel()
    {
        return (boolean)$this->get('academy_published_email_model');
    }
    
    function getPublishedEmailModel()
    {
        return new SystemModelEmail($this->get('academy_published_email_model','academy_published_email_model'));
    }
    
     function hasCommittedEmailModel()
    {
        return (boolean)$this->get('academy_committed_email_model');
    }
    
    function getCommittedEmailModel()
    {
        return new SystemModelEmail($this->get('academy_committed_email_model','academy_committed_email_model'));
    }
    
     function hasRefusedEmailModel()
    {
        return (boolean)$this->get('academy_refused_email_model');
    }
    
    function getRefusedEmailModel()
    {
        return new SystemModelEmail($this->get('academy_refused_email_model','academy_refused_email_model'));
    }
    
     function hasDeletedEmailModel()
    {
        return (boolean)$this->get('academy_deleted_email_model');
    }
    
    function getDeletedEmailModel()
    {
        return new SystemModelEmail($this->get('academy_deleted_email_model','academy_deleted_email_model'));
    }
    
    function getAdminRecipients()
     {
         if ($this->hasAdminRecipients())
            return $this->get("academy_admin_recipients");
         return new mfArray();
     }
     
      function hasAdminRecipients()
    {
        return (boolean)$this->get('academy_admin_recipients');
    }  
    
}
