<?php

class EmployerInvitationSettings extends SiteSettings {
    
    
    function getDefaults()
    {
       
        $this->add(array( 
                   'employers_invitation_admin_recipients'=>null,
                   'employers_invitation_email_model'=>null,
            ));
        
    }
      
    function getInvitationEmailModel()
    {
        return new SystemModelEmail($this->get('employers_invitation_email_model','employers_invitation_email_model'));
    }
    
     
    function getInvitationRecipients()
     {
         if ($this->hasInvitationRecipients())
            return $this->get("employers_invitation_admin_recipients");
         return new mfArray();
     }
     
      function hasInvitationRecipients()
    {
        return (boolean)$this->get('employers_invitation_admin_recipients');
    }  
}
