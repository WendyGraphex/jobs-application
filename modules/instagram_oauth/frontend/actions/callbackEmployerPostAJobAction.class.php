<?php

/*
 * http://www.project55.net/instagram/oauth/callback/employer/post-a-job
 */

class instagram_oauth_callbackEmployerPostAJobAction extends mfActions {

    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                
             $oauth= new InstagramClient();
            $oauth->setApiCallback($oauth->getSettings()->getEmployerPostAJobUri());                                         
            $oauth->setAccessToken($oauth->getOAuthToken($request->getGetParameter('code'),false));           
             $user=$oauth->getUser();
            if ($user->error)
                throw new mfException(__("Instagram Oauth failed."));           
            $employer = new EmployerUser(array('instagram_user'=>$user->id)); 
            $employer->add(array(  
                'username'=>$user->username,
                'is_locked'=>'NO'
            ))->validate();
                         
         //  $employer->uploadAvatarFromUrl(new InstagramPicture($oauth->getUserPicture())); 
                          
                $this->getUser()->getStorage()->write('post_a_job_employer_user',$employer);                                                                     
                $this->getUser()->getStorage()->write('post_a_job_employer_user_callback',true);                 
        }
        catch (Exception $e) {     
                 $messages->addError($e);
              //   echo "<!-- ".$e->getMessage()." -->";
        }
         $this->redirect("/");   
}
}




