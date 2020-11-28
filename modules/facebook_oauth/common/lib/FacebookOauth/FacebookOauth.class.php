<?php
 require_once __DIR__ .'/../../Vendors/Facebook/Facebook.php';   
 
class FacebookOauth extends  Facebook\Facebook{
   
    function __construct() {
         $this->settings= new  SiteSettings();
          parent::__construct([
            'app_id' => $this->settings->get('facebook_app_id'),
            'app_secret' => $this->settings->get('facebook_app_secret'), 
            //'default_graph_version' => FacebookOauthSettings::DEFAULT_GRAPH_VERSION,
          ]);                         
    }
    
    function getEmployeeUrlCallBack()
    {
        return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("facebook_oauth_callback_employee");
    }
    
     function getEmployerUrlCallBack()
    {
        return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("facebook_oauth_callback_employer");
    }
    
     function getEmployerPostAJobUrlCallBack()
    {
        return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("facebook_oauth_callback_employer_post_a_job");
    }
    
     function getEmployeeWantAJobUrlCallBack()
    {
        return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("facebook_oauth_callback_employee_want_a_job");
    }
    
     function getTeacherUrlCallBack()
    {
        return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("facebook_oauth_callback_teacher");
    }
    
     function getStudentUrlCallBack()
    {
        return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("facebook_oauth_callback_student");
    }
    
     function getEventUserUrlCallBack()
    {
        return "https://".mfContext::getInstance()->getRequest()->getHost().url_to("facebook_oauth_callback_event_user");
    }
    
    
      
     function getEmployeeLoginUrl()
    {         
        return $this->getRedirectLoginHelper()->getLoginUrl($this->getEmployeeUrlCallBack(),['email']);                
    } 
    
    function getEmployerLoginUrl()
    {
         
        return $this->getRedirectLoginHelper()->getLoginUrl($this->getEmployerUrlCallBack(),['email']);                
    } 
    
    function getTeacherLoginUrl()
    {         
        return $this->getRedirectLoginHelper()->getLoginUrl($this->getTeacherUrlCallBack(),['email']);                
    } 
    
      function getStudentLoginUrl()
    {         
        return $this->getRedirectLoginHelper()->getLoginUrl($this->getStudentUrlCallBack(),['email']);                
    } 
    
       function getEventUserLoginUrl()
    {         
        return $this->getRedirectLoginHelper()->getLoginUrl($this->getEventUserUrlCallBack(),['email']);                
    } 

    function getUser()
    {
         return $this->get("/me?fields=email,picture.width(500),first_name,last_name")->getGraphUser();      
    } 
    
    function getException()
    {
        return parent:: FacebookSDKException();
    }
    
    function getEmployerPostAJobLoginUrl()
    {         
        return $this->getRedirectLoginHelper()->getLoginUrl($this->getEmployerPostAJobUrlCallBack(),['email']);                
    } 
    
     function getEmployeeWantAJobLoginUrl()
    {         
        return $this->getRedirectLoginHelper()->getLoginUrl($this->getEmployeeWantAJobUrlCallBack(),['email']);                
    } 
       
}  

