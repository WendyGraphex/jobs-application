<?php

class InstagramOauthSettings extends SiteSettings {
    
   
    
    function getDefaults() {
        $this->add(array(
                  'instagram_ouath_api_key'=>'978022305953859', //'291296452292996',
                  'instagram_ouath_api_secret'=>'d22737480d7613e9524f1a028797eb01', //'dd97361982fb4f5e505d3023b338791d',   
        ));
    }
    
    
    function getConfigs()
    {
        return array( 'apiKey'=>$this->get('instagram_ouath_api_key'),
                      'apiSecret'=>$this->get('instagram_ouath_api_secret'));
    }
    
    
    function getEmployeeUri()
    {
        return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("instagram_oauth_callback_employee");
    }
    
     function getEmployerUri()
    {
         return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("instagram_oauth_callback_employer");
    }
    
     function getEventUserUri()
    {
         return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("instagram_oauth_callback_event_user");
    }
    
     function getStudentUri()
    {
         return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("instagram_oauth_callback_student");
    }
    
     function getTeacherUri()
    {
         return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("instagram_oauth_callback_teacher");
    }
    
    function getEmployeeWantAJobUri()
    {
        return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("instagram_oauth_callback_employee_want_a_job");
    }
    
     function getEmployerPostAJobUri()
    {
         return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("instagram_oauth_callback_employer_post_a_job");
    }
}
