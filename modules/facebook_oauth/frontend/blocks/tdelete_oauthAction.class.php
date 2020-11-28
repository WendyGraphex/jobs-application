<?php


class facebook_oauth_oauthActionComponent extends mfActionComponent {
    
 
    function execute(mfWebRequest $request) {                                                           
         $fb = new Facebook2([
          'app_id' => '3342518239135854',
          'app_secret' => '5c1ab6382d00c4874a202fc5abc71ee9',
          'default_graph_version' => 'v2.10'
        ]);
        //$helper = $fb->getRedirectLoginHelper();
        $this->url=$fb->getRedirectLoginHelper()->getLoginUrl(url_to("facebook_oauth_callback"));    
    } 
    
    
}

