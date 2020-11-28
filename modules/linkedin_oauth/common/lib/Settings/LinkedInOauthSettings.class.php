<?php

class LinkedInOauthSettings extends SiteSettings {
    
     function getDefaults() {
        $this->add(array(
                  'linkedin_oauth_api_client'=>'978022305953859',  
                  'linkedin_oauth_api_secret'=>'d22737480d7613e9524f1a028797eb01',  
        ));
    }      
    
    
    function getEmployeeUri()
    {
        return url_to("linkedin_oauth_callback_employee",array(),'frontend','');
    }

    function getEmployerUri()
    {
        return url_to("linkedin_oauth_callback_employer",array(),'frontend','');
    }
    
    
    function getTeacherUserUri()
    {
        return url_to("linkedin_oauth_callback_teacher",array(),'frontend','');
    }

    function getStudentUserUri()
    {
        return url_to("linkedin_oauth_callback_student",array(),'frontend','');
    }
    
    function getEventUserUri()
    {
        return url_to("linkedin_oauth_callback_event_user",array(),'frontend','');
    }
    
}
