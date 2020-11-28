<?php

class linkedin_oauth_oauthBtnPostAJobEmployerActionComponent extends mfActionComponent  {

    function execute(mfWebRequest $request) {
        try
        {
              $oauth = new LinkedInOauth();                         
              $this->auth_url = $oauth->setCallback($oauth->getSettings()->getEmployerUri())->getApiUri();                                     
              $this->target=$this->getParameter('target');    
        } 
        catch (Exception $ex) {
            $this->error=$ex->getMessage();
        }            
    }
}

