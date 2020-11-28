<?php

class ProjectSettings extends SiteSettings {
        
    
     function getDefaults()
    {
        parent::getDefaults();         
        $this->add(array( 
             // 'payment_format_reference'=>'CART-{id}',
            //  'payment_format_id'=>'0000',
             // 'order_default_currency'=>'USD',
            'project_task_reference_format'=>'T{nnnn}'
        ));        
    }
      
   
    function getDateChangeEmailModel()
    {        
        return new SystemModelEmail($this->get('project_change_date_email_model','project_change_date_email_model'));    
    }
    
    function getAdminRecipients()
     {
         if ($this->hasAdminRecipients())
            return $this->get("project_admin_recipients");
         return new mfArray();
     }
     
      function hasAdminRecipients()
    {
        return (boolean)$this->get('project_admin_recipients');
    }  
}
