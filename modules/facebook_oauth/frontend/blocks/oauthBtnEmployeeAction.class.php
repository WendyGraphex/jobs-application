<?php

class facebook_oauth_oauthBtnEmployeeActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {   
            
           $fb=new FacebookOauth();           
           $this->url=$fb->getEmployeeLoginUrl();   
           $this->target=$this->getParameter('target');
           //var_dump($this->url); 
    } 
        
}
