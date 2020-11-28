<?php

class linkedin_oauth_callbackTeacherAction extends mfActions {

   function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                      
            $api = new LinkedinOauth();
            $api->setCallback($api->getSettings()->getEmployeeUri());
            $api->setCode($request->getGetParameter('code'));
            if(!$api->getToken())
                throw new Exception("-- invalid token --");
            $teacher_user = new CustomerAcademyTeacherUser(array('linkedin_user'=>$api->getMe()->getId()));          
            $teacher_user->add(array(
                "firstname" => $api->getMe()->getFirstName(), 
                "lastname" => $api->getMe()->getLastName(),
                "is_locked" => 'NO',
                    )); 
             $teacher_user->validate();
             $api->getPicture($api->getMe());
             //var_dump($api);
           //  var_dump($api->getMe());
             $teacher_user->uploadAvatarFromUrl(new LinkedinPicture($api->getMe()->getPicture()));             
             $this->getUser()->signin($teacher_user,$request->getIp());
             $this->getEventDispather()->notify(new mfEvent($teacher_user, 'teacher_user.connected'));
             $this->redirect(to_link_i18n(mfConfig::get('mf_customers_academy_teacher_redirect_account')));
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




