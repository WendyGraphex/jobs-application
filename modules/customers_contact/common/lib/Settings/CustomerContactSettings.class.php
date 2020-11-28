<?php

class CustomerContactSettings extends SiteSettings {
    
    
    function getDefaults()
    {
       
        $this->add(array( 
                   'customers_contact_admin_recipients'=>null,
                   'customers_contact_email_model'=>null,
            ));
        
    }
      
    function getRegistrationEmailModel()
    {
        return new SystemModelEmail($this->get('customers_contact_email_model','customers_contact_email_model'));
    }
    
     
    function getRegistrationRecipients()
     {
         if ($this->hasRegistrationRecipients())
            return $this->get("customers_contact_admin_recipients");
         return new mfArray();
     }
     
      function hasRegistrationRecipients()
    {
        return (boolean)$this->get('customers_contact_admin_recipients');
    }  
}
