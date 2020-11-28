<?php

class google_oauth_callbackEmployerAction extends mfActions {

    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                      
            $client = new GoogleClient();
            $settings =new GoogleOauthSettings(); 
                         
            $client->setAuthConfig ($settings->getFile());
            $client->setRedirectUri($settings->getEmployerUri());      
            
            $client->authenticate($request->getGetParameter('code'));                                    
            $access_token = $client->getAccessToken();
                         
            $client->setAccessToken($access_token);                          
             
            $client->authenticate($request->getGetParameter('code'));  
                         
           if (!$access_token) 
                throw new mfException(__('Error oauth google'));           
             $client->setAccessToken($access_token); 
            $oAuth = new Google_Service_Oauth2($client);
            $user = $oAuth->userinfo->get();

            
            $employer = new EmployerUser($user->getEMail()); 
            $employer->add(array(
                'firstname'=>$user->getGivenName(),                       
                'lastname'=>$user->getFamilyName(),
                'is_locked'=>'NO'
            ))->validate();
            $employer->uploadAvatarFromUrl(new GooglePicture($user->getPicture()));
                 
            $this->getUser()->signin($employer,$request->getIp());
            $this->getEventDispather()->notify(new mfEvent($employer, 'employer.connected'));               
            $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_account')));  
        }
        catch (Exception $e) {     
                 $messages->addError($e);
                echo "<!-- ".$e->getMessage()." -->";
        }
        $this->forward($this->getModuleName (), 'callbackError');
}
}




