<?php

class google_oauth_callbackStudentAction extends mfActions {

    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                      
            $client = new GoogleClient();
            $settings =new GoogleOauthSettings(); 
                         
            $client->setAuthConfig ($settings->getFile());
            $client->setRedirectUri($settings->getStudentUri());      
            
            $client->authenticate($request->getGetParameter('code'));                                    
            $access_token = $client->getAccessToken();
                         
            $client->setAccessToken($access_token);                          
             
            $client->authenticate($request->getGetParameter('code'));  
                         
           if (!$access_token) 
                throw new mfException(__('Error oauth google'));           
             $client->setAccessToken($access_token); 
            $oAuth = new Google_Service_Oauth2($client);
            $user = $oAuth->userinfo->get();

            
            $student = new EmployerUser($user->getEMail()); 
            $student->add(array(
                'firstname'=>$user->getGivenName(),                       
                'lastname'=>$user->getFamilyName(),
                'is_locked'=>'NO'
            ))->validate();
            $student->uploadAvatarFromUrl(new GooglePicture($user->getPicture()));
                 
            $this->getUser()->signin($student,$request->getIp());
            $this->getEventDispather()->notify(new mfEvent($student, 'customers_academy_student.user.connected'));                   
            $this->redirect(to_link_i18n(mfConfig::get('mf_customers_academy_student_redirect_account')));   
        }
        catch (Exception $e) {     
                 $messages->addError($e);
                echo "<!-- ".$e->getMessage()." -->";
        }
        $this->forward($this->getModuleName (), 'callbackError');
}
}




