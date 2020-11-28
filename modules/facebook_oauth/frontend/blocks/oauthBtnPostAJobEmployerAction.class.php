<?php

class facebook_oauth_oauthBtnPostAJobEmployerActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {   
            
           $fb=new FacebookOauth();           
             $this->url=$fb->getEmployerPostAJobLoginUrl();   
             $this->target=$this->getParameter('target');
           //var_dump($this->url); 
    } 
        
}
