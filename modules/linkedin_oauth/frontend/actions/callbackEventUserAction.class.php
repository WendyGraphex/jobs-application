<?php

class linkedin_oauth_callbackEventUserAction extends mfActions {

    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                      
            $api = new LinkedinOauth();
            $api->setCallback($api->getSettings()->getEmployeeUri());
            $api->setCode($request->getGetParameter('code'));
            if(!$api->getToken())
                throw new Exception("-- invalid token --");
            $event_user = new SiteEventUser(array('linkedin_user'=>$api->getMe()->getId()));          
            $event_user->add(array(
                "firstname" => $api->getMe()->getFirstName(), 
                "lastname" => $api->getMe()->getLastName(),
                "is_locked" => 'NO',
                    )); 
             $event_user->validate();
             $api->getPicture($api->getMe());
             //var_dump($api);
           //  var_dump($api->getMe());
             $event_user->uploadAvatarFromUrl(new LinkedinPicture($api->getMe()->getPicture()));             
             $this->getUser()->signin($event_user,$request->getIp());
             $this->getEventDispather()->notify(new mfEvent($event_user, 'site_event_user.connected'));
             $this->redirect(to_link_i18n(mfConfig::get('mf_site_event_redirect_account')));
        }      
        catch (Exception $e) {     
                 $messages->addError($e);
                 echo "<!-- ".$e->getMessage()." -->";
              //   echo $e->getMessage();
               //             die(__METHOD__);

        }
        $this->forward($this->getModuleName (), 'callbackError');
    }
}




