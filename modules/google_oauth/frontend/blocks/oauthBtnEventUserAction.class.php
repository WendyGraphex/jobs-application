<?php

class google_oauth_oauthBtnEventUserActionComponent extends mfActionComponent  {

    function execute(mfWebRequest $request) {
        try
        {
            $client = new GoogleClient();
            $settings =new GoogleOauthSettings();           
            $client->setAuthConfig($settings->getFile());        
            $client->addScope([Google_Service_Oauth2::USERINFO_PROFILE,Google_Service_Oauth2::USERINFO_EMAIL]);       
            $client->setRedirectUri($settings->getEventUseUri());      
            $this->auth_url = $client->createAuthUrl();          
            $this->target=$this->getParameter('target');
        } 
        catch (Exception $ex) {
            $this->error=$ex->getMessage();
        }            
    }
}

