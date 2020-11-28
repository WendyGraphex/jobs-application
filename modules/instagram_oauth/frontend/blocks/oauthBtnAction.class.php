<?php

class instagram_oauth_oauthBtnActionComponent extends mfActionComponent  {

    function execute(mfWebRequest $request) {    
        try
        {
              $oauth= new Instagram(array(
                  'apiKey'=>'291296452292996',
                  'apiSecret'=>'dd97361982fb4f5e505d3023b338791d',
                  'apiCallback'=>'https://www.project50.net/return',                  
              ));
              
              $this->auth_url=$oauth->getLoginUrl(array('user_profile','user_media'));                                        
              $this->target=$this->getParameter('target');             
        } 
        catch (Exception $ex) {
            $this->error=$ex->getMessage();
        }
    }
}

