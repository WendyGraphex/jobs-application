<?php

class CustomerNewsletterSettings extends SiteSettings {
    
    
    function getDefaults()
    {
       
        $this->add(array( 
                   'customers_newsletter_admin_recipients'=>null,
                   'customers_newsletter_email_model'=>null,
            ));
        
    }
      
    function getRegistrationEmailModel()
    {
        return new SystemModelEmail($this->get('customers_newsletter_email_model','customers_newsletter_email_model'));
    }
    
     
    function getRegistrationRecipients()
     {
         if ($this->hasRegistrationRecipients())
            return $this->get("customers_newsletter_admin_recipients");
         return new mfArray();
     }
     
      function hasRegistrationRecipients()
    {
        return (boolean)$this->get('customers_newsletter_admin_recipients');
    }  
}
