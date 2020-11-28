<?php

class facebook_oauth_oauthBtnEmployerActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {   
            
           $fb=new FacebookOauth();           
             $this->url=$fb->getEmployerLoginUrl();   
             $this->target=$this->getParameter('target');
           //var_dump($this->url); 
    } 
        
}
