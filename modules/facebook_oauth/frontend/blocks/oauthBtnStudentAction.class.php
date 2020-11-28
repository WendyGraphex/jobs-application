<?php

class facebook_oauth_oauthBtnStudentActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {   
            
           $fb=new FacebookOauth();           
             $this->url=$fb->getStudentLoginUrl();   
             $this->target=$this->getParameter('target');
           //var_dump($this->url); 
    } 
        
}
