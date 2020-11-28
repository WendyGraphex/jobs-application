<?php

class GoogleOauthSettings extends SiteSettings {
    
    function getFile() {
    /*     $data = '{"web":{"client_id":"1006732131340-rjon7skbo6fr4p97gc7fdsfrmvupotb7.apps.googleusercontent.com",
                  "project_id":"pelagic-height-124412",
                  "auth_uri":"https://accounts.google.com/o/oauth2/auth",
                  "token_uri":"https://oauth2.googleapis.com/token",
                  "auth_provider_x509_cert_url":"https://www.googleapis.com/oauth2/v1/certs",
                  "client_secret":"GbRBZOmkdmT6xoqrkWnfcRVA",
                  "redirect_uris":["http://www.project55.net/google/oauth/callback/employee",
                                   "http://www.project55.net/google/oauth/callback/employer",
                                   "https://graphex.ewebsolutionskech-dev.com/google/oauth/callback/employee",
                                   "https://graphex.ewebsolutionskech-dev.com/google/oauth/callback/employer"]
                  }}'; 
    
     /*
     {"web":{"client_id":"1006732131340-rjon7skbo6fr4p97gc7fdsfrmvupotb7.apps.googleusercontent.com",
                  "project_id":"pelagic-height-124412",
                  "auth_uri":"https://accounts.google.com/o/oauth2/auth",
                  "token_uri":"https://oauth2.googleapis.com/token",
                  "auth_provider_x509_cert_url":"https://www.googleapis.com/oauth2/v1/certs",
                  "client_secret":"GbRBZOmkdmT6xoqrkWnfcRVA",            
                  }}
     * /   
     return json_decode($data, true);*/
       $data = json_decode($this->get('google_app_secret'), true);      
       return $data;
    } 
    
    function getEmployeeUri()
    {
        return url_to("google_oauth_callback_employee",array(),'frontend','');
    }
    
     function getEmployerUri()
    {
         return url_to("google_oauth_callback_employer",array(),'frontend','');
    }
    
     function getEventUserUri()
    {
         return url_to("google_oauth_callback_event_user",array(),'frontend','');
    }
    
     function getStudentUri()
    {
         return url_to("google_oauth_callback_student",array(),'frontend','');
    }
    
     function getTeacherUri()
    {
         return url_to("google_oauth_callback_teacher",array(),'frontend','');
    }
    
    function getEmployeeWantAJobUri()
    {
        return url_to("google_oauth_callback_employee_want_a_job",array(),'frontend','');
    }
    
     function getEmployerPostAJobUri()
    {
         return url_to("google_oauth_callback_employer_post_a_job",array(),'frontend','');
    }
}
