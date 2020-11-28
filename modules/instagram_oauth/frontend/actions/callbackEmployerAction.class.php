<?php

class instagram_oauth_callbackEmployerAction extends mfActions {

    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                
            $oauth= new InstagramClient();
            $oauth->setApiCallback($oauth->getSettings()->getEmployerUri());                                         
            $oauth->setAccessToken($oauth->getOAuthToken($request->getGetParameter('code'),false));
            $user=$oauth->getUser();
            if ($user->error)
                throw new mfException(__("Instagram Oauth failed."));
            $employer = new EmployerUser(array('instagram_user'=>$user->id)); 
            $employer->add(array(  
                'username'=>$user->username,
                'is_locked'=>'NO'
            ))->validate();
                         
         //   $employer->uploadAvatarFromUrl(new InstagramPicture($oauth->getUserPicture())); 
            
           /* $url="https://instagram.frak1-2.fna.fbcdn.net/v/t51.2885-19/s320x320/89641610_674909329922277_2445331194661830656_n.jpg?_nc_ht=instagram.frak1-2.fna.fbcdn.net&_nc_ohc=rokogABDUxgAX9hljtv&oh=2c8fac9c6ca8027451ad05fd7a74a71e&oe=5F54B175";
            $picture=new InstagramPicture($url);*/
                      
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




