<?php

class instagram_oauth_oauthBtnTeacherActionComponent extends mfActionComponent  {

    function execute(mfWebRequest $request) {
        try
        {
             $oauth= new InstagramClient();
              $oauth->setApiCallback($oauth->getSettings()->getTeacherUri());
              $this->auth_url=$oauth->getLoginUrl(array('user_profile','user_media'));                                        
              $this->target=$this->getParameter('target');   
        } 
        catch (Exception $ex) {
            $this->error=$ex->getMessage();
        }            
    }
}

