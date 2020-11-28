<?php

class CustomerMessagerSettings extends SiteSettings {
    
    
    function getDefaults()
    {
        parent::getDefaults();       
        $this->add(array( 
                        /*    "employee_email_model"=>null,
                            "employer_email_model"=>null,
                            "admin_email_model"=>null,*/
                            "message_email_model"=>null,
                            "employee_first_message_model"=>null,
                            "employer_first_message_model"=>null,
                          
            ));
        
    }
    
      function hasEmailModel()
    {
        return $this->get('message_email_model')?$this->getEmailModel()->isLoaded():false;
    }
    
    function getEmailModel()
    {
        return $this->message_email_model=$this->message_email_model===null?new SystemModelEmail($this->get('message_email_model')):$this->message_email_model;
    }
    
     function hasEmployeeEmailModel()
    {
        return $this->get('employee_email_model')?$this->getEmployeeEmailModel()->isLoaded():false;
    }
    
    function getEmployeeEmailModel()
    {
        return $this->employee_email_model=$this->employee_email_model===null?new SystemModelEmail($this->get('employee_email_model')):$this->employee_email_model;
    }
    
     function hasEmployerEmailModel()
    {
        return $this->get('employer_email_model')?$this->getEmployerEmailModel()->isLoaded():false;
    }
    
    function getEmployerEmailModel()
    {
        return $this->employer_email_model=$this->employer_email_model===null?new SystemModelEmail($this->get('employer_email_model')):$this->employer_email_model;
    }    
      
 /*
     function hasAdminEmailModel()
    {
        return $this->get('admin_email_model')?$this->getAdminEmailModel()->isLoaded():false;
    }
    
    function getAdminEmailModel()
    {
        return $this->admin_email_model=$this->admin_email_model===null?new SystemModelEmail($this->get('admin_email_model')):$this->admin_email_model;
    } */
    
    
    function getEmployerFirstMessageModel()
    {
        return $this->employer_first_message_model=$this->employer_first_message_model===null?new SystemModelEmail($this->get('employer_first_message_model')):$this->employer_first_message_model;
    }
    
    function getEmployeeFirstMessageModel()
    {
        return $this->employee_first_message_model=$this->employee_first_message_model===null?new SystemModelEmail($this->get('employee_first_message_model')):$this->employee_first_message_model;
    }
      
}
