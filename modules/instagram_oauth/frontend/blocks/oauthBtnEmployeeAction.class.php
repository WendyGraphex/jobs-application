<?php

class instagram_oauth_oauthBtnEmployeeActionComponent extends mfActionComponent  {

    function execute(mfWebRequest $request) {    
        try
        {
              $oauth= new InstagramClient();
              $oauth->setApiCallback($oauth->getSettings()->getEmployeeUri());
              $this->auth_url=$oauth->getLoginUrl(array('user_profile','user_media'));                                        
              $this->target=$this->getParameter('target');                  
        } 
        catch (Exception $ex) {
            $this->error=$ex->getMessage();
        }
    }
}

