<?php


class facebook_oauth_testAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                                           
                $fb = new Facebook2([
          'app_id' => '3342518239135854',
          'app_secret' => '5c1ab6382d00c4874a202fc5abc71ee9',
          'default_graph_version' => 'v2.10'
        ]);
        $helper = $fb->getRedirectLoginHelper();
        $this->url_login=$helper->getLoginUrl(url_to("facebook_oauth_callback"));    
    } 
    
    
}

