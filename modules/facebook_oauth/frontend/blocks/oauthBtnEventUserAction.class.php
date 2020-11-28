<?php

class facebook_oauth_oauthBtnEventUserActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {   
            
           $fb=new FacebookOauth();           
             $this->url=$fb->getEventUserLoginUrl();   
             $this->target=$this->getParameter('target');
           //var_dump($this->url); 
    } 
        
}
