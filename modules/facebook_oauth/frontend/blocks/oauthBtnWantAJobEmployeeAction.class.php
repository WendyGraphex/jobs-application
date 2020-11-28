<?php

class facebook_oauth_oauthBtnWantAJobEmployeeActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {   
            
           $fb=new FacebookOauth();           
           $this->url=$fb->getEmployeeWantAJobLoginUrl();   
           $this->target=$this->getParameter('target');
           //var_dump($this->url); 
    } 
        
}
