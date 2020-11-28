<?php

class EmployeeUserNotationSettings extends SiteSettings {
    
    
     function getDefaults()
    {
       
        $this->add(array( 
                   'employers_notation_admin_recipients'=>null,
                   'employers_notation_email_model'=>null,
            ));
        
    }
      
    function getRegistrationEmailModel()
    {
        return new SystemModelEmail($this->get('employers_notation_email_model','employers_notation_email_model'));
    }
    
     
    function getRegistrationRecipients()
     {
         if ($this->hasRegistrationRecipients())
            return $this->get("employers_notation_admin_recipients");
         return new mfArray();
     }
     
      function hasRegistrationRecipients()
    {
        return (boolean)$this->get('employers_notation_admin_recipients');
    }  
      
    
}
