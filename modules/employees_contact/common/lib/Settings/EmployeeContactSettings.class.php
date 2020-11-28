<?php

class EmployeeContactSettings extends SiteSettings {
    
    
     function getDefaults()
    {
       
        $this->add(array( 
                   'employees_contact_admin_recipients'=>null,
                   'employees_contact_email_model'=>null,
            ));
        
    }
      
    function getRegistrationEmailModel()
    {
        return new SystemModelEmail($this->get('employees_contact_email_model','employees_contact_email_model'));
    }
    
     
    function getRegistrationRecipients()
     {
         if ($this->hasRegistrationRecipients())
            return $this->get("employees_contact_admin_recipients");
         return new mfArray();
     }
     
      function hasRegistrationRecipients()
    {
        return (boolean)$this->get('employees_contact_admin_recipients');
    }  
      
    
}
