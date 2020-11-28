<?php

class linkedin_oauth_callbackEmployerAction extends mfActions {

     function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                      
            $api = new LinkedinOauth();
            $api->setCallback($api->getSettings()->getEmployerUri());
            $api->setCode($request->getGetParameter('code'));
            if(!$api->getToken())
                throw new Exception("-- invalid token --");
            $employer_user = new EmployerUser(array('linkedin_user'=>$api->getMe()->getId()));          
            $employer_user->add(array(
                "firstname" => $api->getMe()->getFirstName(), 
                "lastname" => $api->getMe()->getLastName(),
                "is_locked" => 'NO',
                    )); 
             $employer_user->validate();
             $api->getPicture($api->getMe());
             //var_dump($api);
           //  var_dump($api->getMe());
             $employer_user->uploadAvatarFromUrl(new LinkedinPicture($api->getMe()->getPicture()));             
             $this->getUser()->signin($employer_user,$request->getIp());
             $this->getEventDispather()->notify(new mfEvent($employer_user, 'employer_user.connected'));
             $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_account')));
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




