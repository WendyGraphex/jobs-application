<?php

class EmployeeInvitationSettings extends SiteSettings {
    
    
    function getDefaults()
    {
       
        $this->add(array( 
                   'employees_invitation_admin_recipients'=>null,
                   'employees_invitation_email_model'=>null,
            ));
        
    }
      
    function getInvitationEmailModel()
    {
        return new SystemModelEmail($this->get('employees_invitation_email_model','employees_invitation_email_model'));
    }
    
     
    function getInvitationRecipients()
     {
         if ($this->hasInvitationRecipients())
            return $this->get("employees_invitation_admin_recipients");
         return new mfArray();
     }
     
      function hasInvitationRecipients()
    {
        return (boolean)$this->get('employees_invitation_admin_recipients');
    }  
}
