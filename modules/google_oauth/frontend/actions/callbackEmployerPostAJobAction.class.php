<?php

/*
 * www.project55.net/google/oauth/callback/employer/post-a-job
 */
class google_oauth_callbackEmployerPostAJobAction extends mfActions {

    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                      
            $client = new GoogleClient();
            $settings =new GoogleOauthSettings(); 
                         
            $client->setAuthConfig ($settings->getFile());
            $client->setRedirectUri($settings->getEmployerPostAJobUri());      
            
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
           
            $this->getUser()->getStorage()->write('post_a_job_employer_user',$employer);                                                                     
            $this->getUser()->getStorage()->write('post_a_job_employer_user_callback',true);            
        }
        catch (Exception $e) {     
                 $messages->addError($e);
              
        }
        $this->redirect("/");
}
}




