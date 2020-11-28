<?php

class EmployeeCommentSettings extends SiteSettings {
    
    
    function getDefaults()
    {
       
        $this->add(array( 
                   'employees_comment_admin_recipients'=>null,
                   'employees_comment_email_model'=>null,
            ));
        
    }
      
    function getRegistrationEmailModel()
    {
        return new SystemModelEmail($this->get('employees_comment_email_model','employees_comment_email_model'));
    }
    
     
    function getRegistrationRecipients()
     {
         if ($this->hasRegistrationRecipients())
            return $this->get("employees_comment_admin_recipients");
         return new mfArray();
     }
     
      function hasRegistrationRecipients()
    {
        return (boolean)$this->get('employees_comment_admin_recipients');
    }  
}
