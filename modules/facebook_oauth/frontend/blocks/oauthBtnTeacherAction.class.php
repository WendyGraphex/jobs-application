<?php

class facebook_oauth_oauthBtnTeacherActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {   
            
           $fb=new FacebookOauth();           
             $this->url=$fb->getTeacherLoginUrl();   
             $this->target=$this->getParameter('target');
           //var_dump($this->url); 
    } 
        
}
