<?php

class EmployerCommentSettings extends SiteSettings {
    
    
    function getDefaults()
    {
       
        $this->add(array( 
                   'employers_comment_admin_recipients'=>null,
                   'employers_comment_email_model'=>null,
            ));
        
    }
      
    function getRegistrationEmailModel()
    {
        return new SystemModelEmail($this->get('employers_comment_email_model','employers_comment_email_model'));
    }
    
     
    function getRegistrationRecipients()
     {
         if ($this->hasRegistrationRecipients())
            return $this->get("employers_comment_admin_recipients");
         return new mfArray();
     }
     
      function hasRegistrationRecipients()
    {
        return (boolean)$this->get('employers_comment_admin_recipients');
    }  
}
