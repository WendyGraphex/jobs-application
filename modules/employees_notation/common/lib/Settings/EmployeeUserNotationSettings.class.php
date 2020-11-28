<?php

class EmployeeUserNotationSettings extends SiteSettings {
    
    
     function getDefaults()
    {
       
        $this->add(array( 
                   'employees_notation_admin_recipients'=>null,
                   'employees_notation_email_model'=>null,
            ));
        
    }
      
    function getRegistrationEmailModel()
    {
        return new SystemModelEmail($this->get('employees_notation_email_model','employees_notation_email_model'));
    }
    
     
    function getRegistrationRecipients()
     {
         if ($this->hasRegistrationRecipients())
            return $this->get("employees_notation_admin_recipients");
         return new mfArray();
     }
     
      function hasRegistrationRecipients()
    {
        return (boolean)$this->get('employees_notation_admin_recipients');
    }  
      
    
}
