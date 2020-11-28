<?php

class instagram_oauth_callbackEventUserAction extends mfActions {

    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                                
        try 
        {                
            $oauth= new InstagramClient();
            $oauth->setApiCallback($oauth->getSettings()->getEventUserUri());                                         
            $oauth->setAccessToken($oauth->getOAuthToken($request->getGetParameter('code'),false));   
            $user=$oauth->getUser();
            if ($user->error)
                throw new mfException(__("Instagram Oauth failed."));
            $event_user = new SiteEventUser(array('instagram_user'=>$user->id)); 
            $event_user->add(array(  
                'username'=>$user->username,
                'is_locked'=>'NO'
            ))->validate();
                         
          //  $event_user->uploadAvatarFromUrl(new InstagramPicture($oauth->getUserPicture())); 
                                
            $this->getUser()->signin($event_user,$request->getIp());
            $this->getEventDispather()->notify(new mfEvent($event_user, 'site_event.user.connected')); 
            $this->redirect(to_link_i18n(mfConfig::get('mf_site_event_redirect_account')));                           
        }
        catch (Exception $e) {     
                 $messages->addError($e);
                 echo "<!-- ".$e->getMessage()." -->";
        }
        $this->forward($this->getModuleName (), 'callbackError');       
    }
}




